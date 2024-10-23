import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_parser/http_parser.dart';
import 'package:intl/intl.dart';
import 'package:mirror_app/pages/camera/model/upload_after_image_model.dart';
import 'package:mirror_app/pages/camera/repository/camera_repository.dart';
import 'package:mirror_app/pages/qrview/model/user_model.dart';
import 'package:mirror_app/pages/qrview/provider/user_provider.dart';

final cameraProvider =
    StateNotifierProvider<CameraStateNotifier, UploadAfterImageModelBase?>(
        (ref) {
  final cameraRepository = ref.watch(cameraRepositoryProvider);

  return CameraStateNotifier(
    cameraRepository: cameraRepository,
    ref: ref,
  );
});

class CameraStateNotifier extends StateNotifier<UploadAfterImageModelBase?> {
  final CameraRepository cameraRepository;
  final Ref ref;
  CameraStateNotifier({
    required this.cameraRepository,
    required this.ref,
  }) : super(UploadAfterImageModelInit());

  Future<UploadAfterImageModelBase?> uploadTakePictureImage(
      List<int> bytes) async {
    state = UploadAfterImageModelLoading();

    final user = ref.read(userProvider);
    if (user is UserModel && user.id != null) {
      List<MultipartFile> files = [];
      final uploadFileName =
          '${DateFormat('yyyyMMddHHmmss').format(DateTime.now())}_${user.id}_org.jpg';
      files.add(
        MultipartFile.fromBytes(
          bytes,
          filename: uploadFileName,
          contentType: MediaType('image', 'jpeg'),
        ),
      );
      if (files.isNotEmpty) {
        state = await cameraRepository.uploadImage(files);
        return state;
      }
      state = UploadAfterImageModelFail();
    } else {
      state = UploadAfterImageModelFail();
    }

    return state;
  }
}
