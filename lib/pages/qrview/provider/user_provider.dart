import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mirror_app/common/storage/secure_storage.dart';
import 'package:mirror_app/pages/closet/provider/closet_provider.dart';
import 'package:mirror_app/pages/qrview/model/sign_in_res_model.dart';
import 'package:mirror_app/pages/qrview/model/token_model.dart';
import 'package:mirror_app/pages/qrview/model/user_model.dart';
import 'package:mirror_app/pages/qrview/repository/auth_repository.dart';
import 'package:mirror_app/pages/qrview/repository/user_repository.dart';
import 'package:mirror_app/utils/logger.dart';

import '../../../common/constants/constants.dart';

final userProvider =
    StateNotifierProvider<UserStateNotifier, UserModelBase?>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  final userRepository = ref.watch(userRepositoryProvider);
  final storage = ref.watch(secureStorageProvider);

  return UserStateNotifier(
    ref: ref,
    authRepository: authRepository,
    userRepository: userRepository,
    storage: storage,
  );
});

class UserStateNotifier extends StateNotifier<UserModelBase?> {
  final Ref ref;
  final AuthRepository authRepository;
  final UserRepository userRepository;
  final FlutterSecureStorage storage;
  UserStateNotifier({
    required this.ref,
    required this.authRepository,
    required this.userRepository,
    required this.storage,
  }) : super(UserModelInit());
  // 내 정보 가져오기
  Future<UserModelBase?> getMe(TokenModel token) async {
    try {
      await storage.write(key: accessTokenKey, value: token.accessToken);
      await storage.write(key: refreshTokenKey, value: token.refreshToken);

      final userResponse = await userRepository.getAccount();
      if (userResponse != null) {
        state = userResponse;
        // 임시 코드 차후 수정 해야함 s
        await storage.write(key: 'gender', value: userResponse.gender ?? 'F');
        // 임시 코드 차후 수정 해야함 e
        await storage.write(
            key: userKey, value: userResponse.toJson().toString());
        ref
            .read(closetProvider.notifier)
            .initClosetGroup(userResponse.gender ?? 'F');
        return userResponse;
      } else {
        state = UserModelBaseError(message: '로그인 실패: ');
        return Future.value(state);
      }
    } catch (e) {
      logger.i('내 정보 가져오기 실패: $e');
      state = UserModelBaseError(message: '내 정보 가져오기 실패: $e');
      return Future.value(state);
    }
  }

  // 로그인 하기
  Future<UserModelBase?> signInMirror(
      {required String mirrorDeviceId,
      required String mirrorUserId,
      required String gender}) async {
    try {
      state = UserModelLoading();

      logger.i(
          'mirrorDeviceId: $mirrorDeviceId, mirrorUserId: $mirrorUserId, gender: $gender');
      final response = await authRepository.signInMirror(
          body: SignInResModel(
        mirrorDeviceId: mirrorDeviceId,
        mirrorUserId: mirrorUserId,
        gender: gender,
      ));
      if (response == null) {
        state = UserModelBaseError(message: '로그인 실패: 토큰이 없음');
        logout();
        return Future.value(state);
      } else {
        return await getMe(response);
      }
    } catch (e) {
      logger.i('로그인 실패: $e');
      state = UserModelBaseError(message: '로그인 실패: $e');
      logout();
      return Future.value(state);
    }
  }

  Future<UserModelBase?> authInitCheck() async {
    state = UserModelLoading();
    try {
      var accessToken = await storage.read(key: accessTokenKey);
      var refreshToken = await storage.read(key: refreshTokenKey);
      if (accessToken != null && refreshToken != null) {
        final response = await authRepository.signInToken();

        if (response == null) {
          logout();
          return Future.value(state);
        }
        await storage.write(key: accessTokenKey, value: response.accessToken);
        await storage.write(key: refreshTokenKey, value: response.refreshToken);

        final userResponse = await userRepository.getAccount();
        if (userResponse != null) {
          return await getMe(response);
        } else {
          logout();
          return Future.value(state);
        }
        //
      } else {
        logout();
        return Future.value(null);
      }
    } catch (e) {
      logger.i('로그인 실패: $e');
      state = UserModelBaseError(message: '로그인 실패: $e');
      logout();
      return Future.value(state);
    }
  }

  Future<void> logout() async {
    state = null;
    await Future.wait([
      storage.delete(key: accessTokenKey),
      storage.delete(key: refreshTokenKey),
      storage.delete(key: userKey),
      ref.read(closetProvider.notifier).resetClosetGroup(),
    ]);
  }
}
