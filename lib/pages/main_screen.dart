// ignore_for_file: use_build_context_synchronously

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mirror_app/common/constants/constants.dart';
import 'package:mirror_app/common/widget/appbar.dart';
import 'package:mirror_app/common/widget/modal_dialog.dart';
import 'package:mirror_app/common/widget/progress/custom_progress.dart';
import 'package:mirror_app/common/widget/snack_bar.dart';
import 'package:mirror_app/pages/qrview/model/user_model.dart';
import 'package:mirror_app/pages/qrview/provider/user_provider.dart';
import 'package:mirror_app/utils/logger.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../common/constants/main_menu.dart';
import '../common/widget/button/mainbutton.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // _asyncMethod();
    });
  }

  loginAction() async {
    try {
      context.push('/qrView').then((value) {
        logger.e('loginAction value!!!: $value');
        if (value != null) {
          showTopSnackBar(
            Overlay.of(context),
            const CustomSnackBarWidget.success(
              message: "미러 계정 로그인 성공",
            ),
          );
          logger.e(value);
        } else {
          showTopSnackBar(
            Overlay.of(context),
            const CustomSnackBarWidget.error(
              message: "미러 계정 로그인에 실패 하였습니다.",
            ),
          );
        }
      });
    } catch (e) {
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.error(
          message: "미러 계정 로그인 실패",
        ),
      );
    }
  }

  photoAction() async {
    await availableCameras().then((value) {
      context.push('/camera', extra: value).then((onValue) async {
        if (onValue != null) {
          showTopSnackBar(
            Overlay.of(context),
            const CustomSnackBarWidget.success(
              message: "사진 촬영 완료",
            ),
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarWidget(
        titleSvg: 'assets/images/common/logo.svg',
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 20.0.w,
                ),
                Expanded(
                  child: ListView(
                    children: styleMirrorMenus.map((menu) {
                      return MainButtonWidget(
                        title: '${menu['title']}',
                        image: '${menu['image']}',
                        isGradient: bool.parse('${menu['isGradient']}'),
                        text: '${menu['text']}',
                        disabled: menu['label'] == 'guide'
                            ? false
                            : menu['label'] == 'login'
                                ? (user is UserModel)
                                : user is! UserModel,
                        onPressed: () {
                          if (menu['label'] == 'login') {
                            loginAction();
                          }
                          if (menu['label'] == 'photo') {
                            photoAction();
                          }
                          if (menu['label'] == 'guide') {
                            context.push('/guide');
                          }
                          if (menu['label'] == 'closet') {
                            context.push('/closet');
                          }
                        },
                      );
                    }).toList(),
                  ),
                ),
                if (user is UserModel)
                  TextButton(
                    onPressed: () {
                      _logoutBuilder(context);
                    },
                    child: Text(
                      '로그아웃',
                      style: TextStyle(
                        color: Colors.black,
                        height: 1.2,
                        fontFamily: 'Pretendard',
                        fontSize: 18.0.w,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20.0.w),
                  child: Text(
                    appVersion,
                    style: TextStyle(
                      color: Colors.grey,
                      height: 1.2,
                      fontFamily: 'Pretendard',
                      fontSize: 12.0.w,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            if (user is UserModelLoading)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                top: 0,
                child: Container(
                  height: 1.0.w,
                  color: Colors.white.withOpacity(0.5),
                  child: const Center(
                    child: CustomProgress(),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _logoutBuilder(BuildContext context) {
    return showDialog<void>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return ModalDialogWidget(
          title: '로그아웃',
          content: '로그아웃 하시겠습니까?',
          buttonText1: '로그아웃',
          onPressed1: () async {
            await ref.watch(userProvider.notifier).logout();
            context.pop();
            showTopSnackBar(
              Overlay.of(context),
              const CustomSnackBarWidget.success(
                message: "미러 계정 로그아웃 성공",
              ),
            );
          },
          buttonText2: '취소',
          onPressed2: () {
            context.pop();
          },
        );
      },
    );
  }
}
