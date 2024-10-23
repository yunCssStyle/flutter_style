import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:mirror_app/common/widget/appbar.dart';
import 'package:mirror_app/common/widget/snack_bar.dart';
import 'package:mirror_app/pages/qrview/model/user_model.dart';
import 'package:mirror_app/pages/qrview/provider/user_provider.dart';
import 'package:mirror_app/utils/logger.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class QRViewScreen extends ConsumerStatefulWidget {
  const QRViewScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _QRViewScreenState();
}

class _QRViewScreenState extends ConsumerState<QRViewScreen> {
  // 네트워크 체크
  List<ConnectivityResult> _connectionStatus = [];
  final Connectivity _connectivity = Connectivity();
  final storage = const FlutterSecureStorage();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  late AnimationController localAnimationController;
  bool isShowSnackbar = false;
  // qr
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

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
    if (!_connectionStatus.contains(ConnectivityResult.none)) {
      if (isShowSnackbar) {
        if (localAnimationController.isCompleted) {
          localAnimationController.reverse();
          isShowSnackbar = false;
        }
      }
    }
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 250.0
        : 300.0;
    return QRView(
      key: qrKey,
      onQRViewCreated: (contr) => _onQRViewCreated(contr),
      overlay: QrScannerOverlayShape(
          borderColor: const Color(0xFFD001E2),
          borderRadius: 6,
          borderLength: 10,
          borderWidth: 10,
          cutOutSize: scanArea),
      // 카메라 사용 권한을 체크한다.
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  // 로그인
  void connectUser(String deviceId, String deviceUser, String gender) async {
    final user = ref.watch(userProvider);
    if (user is! UserModel) {
      await ref.read(userProvider.notifier).signInMirror(
          mirrorDeviceId: deviceId, mirrorUserId: deviceUser, gender: gender);
      nextPage();
    } else {
      context.go('/home');
    }
  }

  // 페이지 이동 context 때문에 async 아닌 곳에서 처리
  void nextPage() {
    try {
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBarWidget.success(
          message: "미러 계정 로그인 성공",
        ),
      );
    } catch (e) {
      logger.e('error', error: e);
    } finally {
      backPage();
    }
  }

  // 백키
  void backPage() {
    Future.delayed(const Duration(milliseconds: 300), () {
      context.go('/home');
    });
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller; // 컨트롤러를 통해 스캐너를 제어
    });

    // 인식시킬 QR코드가 여러개 붙어있을 경우 여러개를 한번에 인식해버리는
    // 문제가 발생하여 먼저 인식된 QR코드 하나만 인식하기위한 코드
    int counter = 0;

    controller.scannedDataStream.listen((scanData) async {
      counter++; // QR코드가 인식되면 counter를 1 올려준다.
      //  // 인식되었으니 카메라를 멈춘다.
      result = scanData;
      String code = result!.code.toString();
      try {
        Map<String, dynamic> user = jsonDecode(code);
        String deviceId = user['deviceId'] ?? '';
        String deviceUser = user['deviceUser'] ?? '';
        String gender = user['gender'] ?? '';
        if (deviceId != '' && deviceUser != '' && gender != '') {
          if (_connectionStatus.contains(ConnectivityResult.none)) {
            if (!isShowSnackbar) {
              isShowSnackbar = true;
              showTopSnackBar(
                Overlay.of(context),
                const CustomSnackBar.error(
                  message: "네트워크 연결을 확인해주세요.",
                ),
                persistent: true,
                onAnimationControllerInit: (controller) =>
                    localAnimationController = controller,
              );
            }
            return;
          }
          await controller.pauseCamera();
          if (counter == 1) {
            connectUser(deviceId, deviceUser, gender);
          }
        }
      } catch (e) {
        logger.e(e);
        backPage();
      }
    });
  }

  // 권한 체크를 위한 함수
  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    if (!p) {
      // 카메라 사용 권한이 없을 경우
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
      backPage();
    }
  }

  // qr_code_scanner의 hot reload를 보장하려면 안드로이드의 경우에는 pauseCamera(),
  // iOS의 경우에는 resumeCamera()를 처리해줘야한다.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  void initState() {
    super.initState();
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    // Future.delayed(const Duration(seconds: 1), () {
    //   connectUser('qQUlkuazG97tChxQAX6i20wyj79cQwu2+Oy+sAaf+gM=', 'eone', 'F');
    // });
  }

  @override
  void dispose() {
    controller?.dispose();
    _connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarWidget(
        title: '스마트 미러 로그인',
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: <Widget>[
            Expanded(flex: 4, child: _buildQrView(context)),
          ],
        ),
      ),
    );
  }
}
