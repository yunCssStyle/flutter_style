import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mirror_app/dio/provider.dart';
import 'package:mirror_app/pages/qrview/model/sign_in_res_model.dart';
import 'package:mirror_app/pages/qrview/model/token_model.dart';
import 'package:retrofit/retrofit.dart';

import '../../../common/constants/constants.dart';

part 'auth_repository.g.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final dio = ref.watch(dioProvider);

  return AuthRepository(
    dio,
    baseUrl: apiBaseUrl,
  );
});

@RestApi()
abstract class AuthRepository {
  factory AuthRepository(Dio dio, {String baseUrl}) = _AuthRepository;
  // 토큰 로그인
  @POST('/api/sign-in/token')
  @Headers({'content-Type': 'application/json', 'accessToken': 'true'})
  Future<TokenModel?> signInToken();
  // 회원 로그인
  @POST('/api/sign-in/mirror')
  @Headers({'content-Type': 'application/json'})
  Future<TokenModel?> signInMirror({
    @Body() required SignInResModel body,
  });
}
