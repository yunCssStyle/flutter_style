import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mirror_app/dio/provider.dart';
import 'package:mirror_app/pages/camera/model/upload_after_image_model.dart';
import 'package:retrofit/retrofit.dart';

import '../../../common/constants/constants.dart';

part 'camera_repository.g.dart';

final cameraRepositoryProvider = Provider<CameraRepository>((ref) {
  final dio = ref.watch(dioProvider);

  return CameraRepository(
    dio,
    baseUrl: apiBaseUrl,
  );
});

@RestApi()
abstract class CameraRepository {
  factory CameraRepository(Dio dio, {String baseUrl}) = _CameraRepository;

  @POST('/services/member/api/user-dresses/upload')
  @Headers({'content-Type': 'multipart/form-data', 'accessToken': 'true'})
  @MultiPart()
  Future<UploadAfterImageModel?> uploadImage(
      @Part() List<MultipartFile> originalImage);
}
