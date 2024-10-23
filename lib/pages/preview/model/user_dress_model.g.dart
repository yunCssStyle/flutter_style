// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dress_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDressModelImpl _$$UserDressModelImplFromJson(Map<String, dynamic> json) =>
    _$UserDressModelImpl(
      gender: json['gender'] as String?,
      adjusted: json['adjusted'] as bool?,
      categoryId: (json['categoryId'] as num?)?.toInt(),
      categoryIds: (json['categoryIds'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      closetCategoryId: (json['closetCategoryId'] as num?)?.toInt(),
      colorType: json['colorType'] as String?,
      lengthType: json['lengthType'] as String?,
      mainImageUrl: json['mainImageUrl'] as String?,
      maskImageUrl: json['maskImageUrl'] as String?,
      necklineType: json['necklineType'] as String?,
      originalImageUrl: json['originalImageUrl'] as String?,
      patternType: json['patternType'] as String?,
      seasonTypes: json['seasonTypes'] as String?,
      sleeveType: json['sleeveType'] as String?,
      userDressRequestId: (json['userDressRequestId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$UserDressModelImplToJson(
        _$UserDressModelImpl instance) =>
    <String, dynamic>{
      'gender': instance.gender,
      'adjusted': instance.adjusted,
      'categoryId': instance.categoryId,
      'categoryIds': instance.categoryIds,
      'closetCategoryId': instance.closetCategoryId,
      'colorType': instance.colorType,
      'lengthType': instance.lengthType,
      'mainImageUrl': instance.mainImageUrl,
      'maskImageUrl': instance.maskImageUrl,
      'necklineType': instance.necklineType,
      'originalImageUrl': instance.originalImageUrl,
      'patternType': instance.patternType,
      'seasonTypes': instance.seasonTypes,
      'sleeveType': instance.sleeveType,
      'userDressRequestId': instance.userDressRequestId,
    };
