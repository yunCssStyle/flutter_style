// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'classification_result_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClassificationResultCategoryModelImpl
    _$$ClassificationResultCategoryModelImplFromJson(
            Map<String, dynamic> json) =>
        _$ClassificationResultCategoryModelImpl(
          id: (json['id'] as num?)?.toInt(),
          type: json['type'] as String?,
          name: json['name'] as String?,
          depth: (json['depth'] as num?)?.toInt(),
          listOrder: (json['listOrder'] as num?)?.toInt(),
          nameFullNm: json['nameFullNm'] as String?,
        );

Map<String, dynamic> _$$ClassificationResultCategoryModelImplToJson(
        _$ClassificationResultCategoryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'name': instance.name,
      'depth': instance.depth,
      'listOrder': instance.listOrder,
      'nameFullNm': instance.nameFullNm,
    };
