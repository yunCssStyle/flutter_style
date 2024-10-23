import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_after_image_model.freezed.dart';
part 'upload_after_image_model.g.dart';

abstract class UploadAfterImageModelBase {}

class UploadAfterImageModelLoading extends UploadAfterImageModelBase {}

class UploadAfterImageModelInit extends UploadAfterImageModelBase {}

class UploadAfterImageModelFail extends UploadAfterImageModelBase {
  String? message;
}

@freezed
class UploadAfterImageModel extends UploadAfterImageModelBase
    with _$UploadAfterImageModel {
  const factory UploadAfterImageModel({
    String? category,
    String? categoryNew,
    String? color,
    String? mainImageUrl,
    String? maskImageUrl,
    String? originImageUrl,
    int? userDressRequestId,
  }) = _UploadAfterImageModel;

  factory UploadAfterImageModel.fromJson(Map<String, dynamic> json) =>
      _$UploadAfterImageModelFromJson(json);
}
