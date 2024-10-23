// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preview_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PreviewModelImpl _$$PreviewModelImplFromJson(Map<String, dynamic> json) =>
    _$PreviewModelImpl(
      gender: json['gender'] as String,
      cate1: (json['cate1'] as num).toInt(),
      cate2: (json['cate2'] as num).toInt(),
      cate3: (json['cate3'] as num).toInt(),
      cate4: (json['cate4'] as num).toInt(),
      color: json['color'] as String,
      pattern: json['pattern'] as String,
      sleeves: json['sleeves'] as String,
      detail: json['detail'] as String,
      lengths: json['lengths'] as String,
      season: json['season'] as String,
      mainImageUrl: json['mainImageUrl'] as String?,
      maskImageUrl: json['maskImageUrl'] as String?,
      originImageUrl: json['originImageUrl'] as String?,
      userDressRequestId: (json['userDressRequestId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$PreviewModelImplToJson(_$PreviewModelImpl instance) =>
    <String, dynamic>{
      'gender': instance.gender,
      'cate1': instance.cate1,
      'cate2': instance.cate2,
      'cate3': instance.cate3,
      'cate4': instance.cate4,
      'color': instance.color,
      'pattern': instance.pattern,
      'sleeves': instance.sleeves,
      'detail': instance.detail,
      'lengths': instance.lengths,
      'season': instance.season,
      'mainImageUrl': instance.mainImageUrl,
      'maskImageUrl': instance.maskImageUrl,
      'originImageUrl': instance.originImageUrl,
      'userDressRequestId': instance.userDressRequestId,
    };
