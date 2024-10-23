import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mirror_app/dio/provider.dart';
import 'package:mirror_app/pages/qrview/model/user_model.dart';
import 'package:retrofit/retrofit.dart';

import '../../../common/constants/constants.dart';

part 'user_repository.g.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  final dio = ref.watch(dioProvider);

  return UserRepository(
    dio,
    baseUrl: apiBaseUrl,
  );
});

@RestApi()
abstract class UserRepository {
  factory UserRepository(Dio dio, {String baseUrl}) = _UserRepository;

  @GET('/api/account')
  @Headers({'content-Type': 'application/json', 'accessToken': 'true'})
  Future<UserModel?> getAccount();
}
