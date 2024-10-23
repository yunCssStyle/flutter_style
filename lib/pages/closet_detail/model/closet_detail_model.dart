import 'package:freezed_annotation/freezed_annotation.dart';

part 'closet_detail_model.freezed.dart';
part 'closet_detail_model.g.dart';

abstract class ClosetDetailModelBase {}

class ClosetGroupListLoading extends ClosetDetailModelBase {}

class ClosetDetailModelBaseError extends ClosetDetailModelBase {}

@freezed
class ClosetDetailModel extends ClosetDetailModelBase with _$ClosetDetailModel {
  const factory ClosetDetailModel({
    String? brandName,
    String? nameEn,
    String? nameKo,
    required String categoryName,
    int? categoryId,
    int? closetCategoryId,
    required String colorType,
    required int id,
    String? inspectionStatus,
    required String mainImageUrl,
    required String patternType,
    required String putOnImageUrl,
    String? putOnPreviewImageUrl,
    required String seasonTypes,
    int? userDressCategory,
    int? userDressRequestId,
    required bool verified,
  }) = _ClosetDetailModel;

  factory ClosetDetailModel.fromJson(Map<String, dynamic> json) =>
      _$ClosetDetailModelFromJson(json);
}
