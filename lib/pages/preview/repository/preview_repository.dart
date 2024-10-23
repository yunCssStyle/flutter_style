import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mirror_app/dio/provider.dart';
import 'package:mirror_app/pages/preview/model/classification_result_model.dart';
import 'package:mirror_app/pages/preview/model/user_dress_model.dart';
import 'package:retrofit/retrofit.dart';

import '../../../common/constants/constants.dart';

part 'preview_repository.g.dart';

final previewRepositoryProvider = Provider<PreviewRepository>((ref) {
  final dio = ref.watch(dioProvider);

  return PreviewRepository(
    dio,
    baseUrl: apiBaseUrl,
  );
});

@RestApi()
abstract class PreviewRepository {
  factory PreviewRepository(Dio dio, {String baseUrl}) = _PreviewRepository;

  @GET('/services/member/api/users/{userId}/user-dresses/requests/{id}')
  @Headers({
    'content-Type': 'application/json;charset=UTF-8',
    'accessToken': 'true',
    'Accept-Language': 'ko-KR,ko;q=0.8,en-US;q=0.5,en;q=0.3',
    'X-Custom-View': 'flat'
  })
  Future<ClassificationResultModel?> getUserClosetList(
      @Path('userId') int userId, @Path('id') int id);

  @POST('/services/member/api/mirror-user-dresses')
  @Headers({'content-Type': 'application/json', 'accessToken': 'true'})
  Future<UserDressModel?> postUserDress({
    @Body() required UserDressModel body,
  });
}
