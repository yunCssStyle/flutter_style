import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mirror_app/dio/provider.dart';
import 'package:mirror_app/pages/closet_detail/model/closet_detail_model.dart';
import 'package:mirror_app/pages/closet_detail/model/product_detail.model.dart';
import 'package:retrofit/retrofit.dart';

import '../../../common/constants/constants.dart';

part 'closet_detail_repository.g.dart';

final closetDetailRepositoryProvider = Provider<ClosetDetailRepository>((ref) {
  final dio = ref.watch(dioProvider);

  return ClosetDetailRepository(
    dio,
    baseUrl: apiBaseUrl,
  );
});

@RestApi()
abstract class ClosetDetailRepository {
  factory ClosetDetailRepository(Dio dio, {String baseUrl}) =
      _ClosetDetailRepository;

  @GET('/services/member/api/v2/user-dresses/users/{id}/{userDressId}')
  @Headers({'content-Type': 'application/json', 'accessToken': 'true'})
  Future<ClosetDetailModel> getUserClosetItem(
      @Path('id') int id, @Path('userDressId') int categoryId);

  @GET('/services/product/api/v2/products/{productId}')
  @Headers({'content-Type': 'application/json', 'accessToken': 'true'})
  Future<ProductDetailModel> getProductItem(@Path('productId') int productId);
}
