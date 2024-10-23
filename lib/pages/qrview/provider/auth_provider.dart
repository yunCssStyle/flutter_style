import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mirror_app/pages/qrview/model/user_model.dart';
import 'package:mirror_app/pages/qrview/provider/user_provider.dart';

final authProvider = ChangeNotifierProvider<AuthProvider>((ref) {
  return AuthProvider(ref: ref);
});

class AuthProvider extends ChangeNotifier {
  final Ref ref;
  AuthProvider({
    required this.ref,
  }) {
    ref.listen<UserModelBase?>(userProvider, (previous, next) {
      // userMeProvider에서 변경 사항이 생겼을 때만
      // authProvider에서 이를 감지
      if (previous != next) {
        notifyListeners();
      }
    });
  }

  void authCheck() {
    ref.read(userProvider.notifier).authInitCheck();
  }

  void logout() {
    ref.read(userProvider.notifier).logout();
  }

  String? redirectLogic(BuildContext _, GoRouterState goState) {
    // final user = ref.read(userProvider);
    // logger.i(
    //     'redirectLogic user: ${user is UserModel}, uri: ${goState.uri.toString()}:, path: ${goState.path}, fullPath: ${goState.fullPath}');

    // if (user is UserModel) {
    //   if (goState.uri.toString() == '/qrView') {
    //     return '/home';
    //   }
    // } else {
    //   if (goState.uri.toString() == '/camera' ||
    //       goState.uri.toString() == 'preview' ||
    //       goState.uri.toString() == '/closet') {
    //     return '/home';
    //   }
    // }
    return null;
  }
}
