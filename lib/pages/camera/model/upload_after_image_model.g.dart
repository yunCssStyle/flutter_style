// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_after_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UploadAfterImageModelImpl _$$UploadAfterImageModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UploadAfterImageModelImpl(
      category: json['category'] as String?,
      categoryNew: json['categoryNew'] as String?,
      color: json['color'] as String?,
      mainImageUrl: json['mainImageUrl'] as String?,
      maskImageUrl: json['maskImageUrl'] as String?,
      originImageUrl: json['originImageUrl'] as String?,
      userDressRequestId: (json['userDressRequestId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$UploadAfterImageModelImplToJson(
        _$UploadAfterImageModelImpl instance) =>
    <String, dynamic>{
      'category': instance.category,
      'categoryNew': instance.categoryNew,
      'color': instance.color,
      'mainImageUrl': instance.mainImageUrl,
      'maskImageUrl': instance.maskImageUrl,
      'originImageUrl': instance.originImageUrl,
      'userDressRequestId': instance.userDressRequestId,
    };
