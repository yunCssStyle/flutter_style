import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mirror_app/common/widget/modal_dialog.dart';
import 'package:mirror_app/common/widget/progress/custom_progress.dart';
import 'package:mirror_app/pages/qrview/provider/auth_provider.dart';
import 'package:restart_app/restart_app.dart';
import 'package:shorebird_code_push/shorebird_code_push.dart';

import '../../common/constants/constants.dart';

// final _shorebirdCodePush = ShorebirdCodePush();

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  bool _isCheckingForUpdate = false;
  bool _isUpdateAvailable = false; // false 로 해야함
  bool _isError = false; // false 로 해야함

  void initialization() async {
    if (mounted) {
      await Future.delayed(const Duration(seconds: 3));
      if (await checkForUpdates()) {
        nextPage();
      }
    }
  }

  void nextPage() {
    final auth = ref.watch(authProvider);
    auth.authCheck();
    context.go('/home');
  }

  @override
  void initState() {
    FlutterNativeSplash.remove();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      initialization();
    });
  }

  Future<bool> checkForUpdates() async {
    setState(() {
      _isCheckingForUpdate = true;
    });
    if (await ShorebirdCodePush().isNewPatchAvailableForDownload()) {
      Future<void>.delayed(const Duration(milliseconds: 250));
      await _downloadUpdate();
      return false;
    } else {
      return true;
    }
  }

  Future<bool> _downloadUpdate() async {
    await Future.wait([
      ShorebirdCodePush().downloadUpdateIfAvailable(),
      Future<void>.delayed(const Duration(milliseconds: 250)),
    ]);
    if (await ShorebirdCodePush().isNewPatchReadyToInstall()) {
      setState(() {
        _isUpdateAvailable = true;
        _isError = false;
      });
      return true;
    } else {
      return false;
    }
  }

  Widget _showErrorBanner() {
    return ModalDialogWidget(
      title: '신규 버전 다운로드 실패',
      content: '신규 버전을 다운로드하는데 실패했습니다. 앱을 다시 실행 해 주세요.',
      buttonText1: '확인',
      onPressed1: () {},
    );
  }

  Widget _showRestartBanner() {
    return ModalDialogWidget(
      title: '앱 다운로드 완료',
      content: '신규 버전을 다운로드 완료했습니다. 앱을 다시 실행 해 주세요.',
      buttonText1: '확인',
      onPressed1: () {
        Restart.restartApp();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Color(0xFF6200B0),
                  Color(0xFFD001E2),
                ],
              ),
            ),
            child: Center(
              child: Image.asset(
                'assets/images/splash/mirror_splash.png',
                width: 140.w,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 52.h,
            child: Center(
              child: Text(
                appVersion,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.w,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Pretendard',
                ),
              ),
            ),
          ),
          if (!_isCheckingForUpdate)
            Positioned(
              left: 0,
              right: 0,
              bottom: 152.h,
              child: Center(
                child: Column(
                  children: [
                    const CustomProgress(),
                    Padding(
                      padding: EdgeInsets.only(top: 8.h),
                      child: Text(
                        '신규 버전을 다운로드 중입니다.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.w,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Pretendard',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          if (_isUpdateAvailable) _showRestartBanner(),
          if (_isError) _showErrorBanner(),
        ],
      ),
    );
  }
}
