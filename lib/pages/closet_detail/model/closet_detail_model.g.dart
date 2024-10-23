// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'closet_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClosetDetailModelImpl _$$ClosetDetailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ClosetDetailModelImpl(
      brandName: json['brandName'] as String?,
      nameEn: json['nameEn'] as String?,
      nameKo: json['nameKo'] as String?,
      categoryName: json['categoryName'] as String,
      categoryId: (json['categoryId'] as num?)?.toInt(),
      closetCategoryId: (json['closetCategoryId'] as num?)?.toInt(),
      colorType: json['colorType'] as String,
      id: (json['id'] as num).toInt(),
      inspectionStatus: json['inspectionStatus'] as String?,
      mainImageUrl: json['mainImageUrl'] as String,
      patternType: json['patternType'] as String,
      putOnImageUrl: json['putOnImageUrl'] as String,
      putOnPreviewImageUrl: json['putOnPreviewImageUrl'] as String?,
      seasonTypes: json['seasonTypes'] as String,
      userDressCategory: (json['userDressCategory'] as num?)?.toInt(),
      userDressRequestId: (json['userDressRequestId'] as num?)?.toInt(),
      verified: json['verified'] as bool,
    );

Map<String, dynamic> _$$ClosetDetailModelImplToJson(
        _$ClosetDetailModelImpl instance) =>
    <String, dynamic>{
      'brandName': instance.brandName,
      'nameEn': instance.nameEn,
      'nameKo': instance.nameKo,
      'categoryName': instance.categoryName,
      'categoryId': instance.categoryId,
      'closetCategoryId': instance.closetCategoryId,
      'colorType': instance.colorType,
      'id': instance.id,
      'inspectionStatus': instance.inspectionStatus,
      'mainImageUrl': instance.mainImageUrl,
      'patternType': instance.patternType,
      'putOnImageUrl': instance.putOnImageUrl,
      'putOnPreviewImageUrl': instance.putOnPreviewImageUrl,
      'seasonTypes': instance.seasonTypes,
      'userDressCategory': instance.userDressCategory,
      'userDressRequestId': instance.userDressRequestId,
      'verified': instance.verified,
    };
