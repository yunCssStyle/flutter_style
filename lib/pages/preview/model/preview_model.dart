import 'package:freezed_annotation/freezed_annotation.dart';

part 'preview_model.freezed.dart';
part 'preview_model.g.dart';

abstract class PreviewModelBase {}

class PreviewModelLoading extends PreviewModelBase {}

class PreviewModelBaseError extends PreviewModelBase {}

@freezed
class PreviewModel extends PreviewModelBase with _$PreviewModel {
  const factory PreviewModel({
    required String gender,
    required int cate1,
    required int cate2,
    required int cate3,
    required int cate4,
    required String color,
    required String pattern,
    required String sleeves,
    required String detail,
    required String lengths,
    required String season,
    String? mainImageUrl,
    String? maskImageUrl,
    String? originImageUrl,
    int? userDressRequestId,
  }) = _PreviewModel;

  factory PreviewModel.fromJson(Map<String, dynamic> json) =>
      _$PreviewModelFromJson(json);
}
