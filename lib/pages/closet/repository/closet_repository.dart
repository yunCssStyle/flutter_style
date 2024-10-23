import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mirror_app/dio/provider.dart';
import 'package:mirror_app/pages/closet/model/closet_menu_model.dart';
import 'package:retrofit/retrofit.dart';

import '../../../common/constants/constants.dart';

part 'closet_repository.g.dart';

final closetRepositoryProvider = Provider<ClosetRepository>((ref) {
  final dio = ref.watch(dioProvider);

  return ClosetRepository(
    dio,
    baseUrl: apiBaseUrl,
  );
});

@RestApi()
abstract class ClosetRepository {
  factory ClosetRepository(Dio dio, {String baseUrl}) = _ClosetRepository;

  @GET(
      '/services/member/api/v2/user-closets/users/{id}/categories/{categoryId}/all?sort=locked,asc&sort=id,desc')
  @Headers({'content-Type': 'application/json', 'accessToken': 'true'})
  Future<List<ClosetMenuModel>> getUserClosetList(
      @Path('id') int id, @Path('categoryId') int categoryId);

  @DELETE('/services/member/api/user-closets/users/{id}')
  @Headers({'content-Type': 'application/json', 'accessToken': 'true'})
  Future<void> deleteUserCloset(@Path('id') int id, @Body() String data);
}
