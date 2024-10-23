import 'dart:async';

import 'package:camera/camera.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mirror_app/common/widget/appbar.dart';
import 'package:mirror_app/common/widget/modal_dialog.dart';
import 'package:mirror_app/common/widget/modal_loading_dialog.dart';
import 'package:mirror_app/common/widget/progress/custom_progress.dart';
import 'package:mirror_app/common/widget/snack_bar.dart';
import 'package:mirror_app/pages/camera/model/upload_after_image_model.dart';
import 'package:mirror_app/pages/camera/provider/camera_provider.dart';
import 'package:mirror_app/routes/router_config.dart';
import 'package:mirror_app/utils/logger.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

// late List<CameraDescription> _cameras;

class CameraScreen extends ConsumerStatefulWidget {
  final List<CameraDescription>? cameras;
  const CameraScreen({super.key, required this.cameras});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CameraScreenState();
}

class _CameraScreenState extends ConsumerState<CameraScreen> {
  late CameraController _cameraController;
  Future<void>? initialize; // 백키 종료 시 에러 방지
  // 네트워크 체크
  List<ConnectivityResult> _connectionStatus = [];
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  late AnimationController localAnimationController;
  bool isShowSnackbar = false;

  // 다음 페이지로 이동
  Future<dynamic> nextPage(UploadAfterImageModel result) {
    GoRouter.of(context).popUntilPath('/camera');
    return context.push('/preview', extra: result);
  }

  // 사진 찍은 후 에러
  void errorDialog() {
    GoRouter.of(context).popUntilPath('/camera');
    _failBuilder(context);
  }

  // 사진 찍기 버튼 누를 때
  Future takePicture() async {
    if (mounted) {
      if (!_cameraController.value.isInitialized) {
        return null;
      }
      if (_cameraController.value.isTakingPicture) {
        return null;
      }
      if (_connectionStatus.contains(ConnectivityResult.none)) {
        // 네트워크 미 연결 시
        showTopSnackBar(
          Overlay.of(context),
          const CustomSnackBar.error(
            message: "네트워크 연결을 확인해주세요.",
          ),
          persistent: true,
          onAnimationControllerInit: (controller) =>
              localAnimationController = controller,
        );
        isShowSnackbar = true;
      }
      try {
        _loadedBuilder(context);
        await _cameraController.setFlashMode(FlashMode.off);
        XFile? picture = await _cameraController.takePicture();
        var result = await ref
            .read(cameraProvider.notifier)
            .uploadTakePictureImage(await picture.readAsBytes());
        if (result is UploadAfterImageModel) {
          await nextPage(result);
        } else {
          // 에러 발생 시
          errorResult();
        }
      } on CameraException catch (e) {
        logger.e(e);
        errorToken();
        errorDialog();
        return null;
      }
    }
  }

  void errorToken() {
    showTopSnackBar(
      Overlay.of(context),
      const CustomSnackBarWidget.error(
        message: "토큰 불량으로 재 로그인 해 주세요.",
      ),
    );
  }

  void errorResult() {
    errorDialog();
  }

  Future initCamera(CameraDescription cameraDescription) async {
    _cameraController = CameraController(
      cameraDescription,
      ResolutionPreset.high,
      enableAudio: false,
    );
    try {
      await _cameraController.initialize().whenComplete(() {
        if (!mounted) return;
        setState(() {
          initialize = null;
        });
      });
    } on CameraException catch (e) {
      debugPrint("camera error $e");
    }
  }

  // 로딩
  Future<void> _loadedBuilder(BuildContext context) {
    return showDialog<void>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return const PopScope(
          canPop: false,
          child: ModalLoadingDialogWidget(
            title: '분석 중',
            content: '찍은 사진을 분석 중입니다.',
          ),
        );
      },
    );
  }

  // 분석 실패
  Future<void> _failBuilder(BuildContext context) {
    return showDialog<void>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return ModalDialogWidget(
          title: '분석 실패',
          content: '의상 분석에 실패했습니다.\n다시 촬영해주시기 바랍니다.',
          buttonText1: '확인',
          onPressed1: () {
            context.pop();
          },
        );
      },
    );
  }

  Future<void> initConnectivity() async {
    late List<ConnectivityResult> result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      logger.e('Couldn\'t check connectivity status', error: e);
      return;
    }
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
    setState(() {
      _connectionStatus = result;
    });
    // ignore: avoid_print
    logger.e('check:${_connectionStatus.contains(ConnectivityResult.none)}');
    if (!_connectionStatus.contains(ConnectivityResult.none)) {
      if (isShowSnackbar) {
        try {
          if (localAnimationController.isCompleted) {
            localAnimationController.reverse();
            isShowSnackbar = false;
          }
        } catch (e) {
          isShowSnackbar = false;
          logger.e('localAnimationController not initialized', error: e);
        }
      }
    }
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    _cameraController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    initCamera(widget.cameras![0]);
    if (mounted) {
      initConnectivity();
      _connectivitySubscription =
          _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: '내 옷 촬영하기',
        textButton: '촬영가이드',
        callback: () {
          context.push('/guide');
        },
      ),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            (_cameraController.value.isInitialized || initialize == null)
                ? Transform.scale(
                    scale: 1.18,
                    child: CameraPreview(_cameraController),
                  )
                : Container(
                    color: Colors.black,
                    child: const Center(
                      child: CustomProgress(),
                    ),
                  ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 50.w),
                child: IconButton(
                  onPressed: takePicture,
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(60.w, 60.w),
                    backgroundColor: Colors.white,
                    shadowColor: Colors.black.withOpacity(0.5),
                  ),
                  iconSize: 60.w,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: SvgPicture.asset(
                    'assets/images/main/camera.svg',
                    semanticsLabel: 'camera',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
