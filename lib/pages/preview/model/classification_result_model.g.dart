// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'classification_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClassificationResultModelImpl _$$ClassificationResultModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ClassificationResultModelImpl(
      originalImageUrl: json['originalImageUrl'] as String?,
      maskImageUrl: json['maskImageUrl'] as String?,
      mainImageUrl: json['mainImageUrl'] as String?,
      color: json['color'] as String?,
      category: json['category'] as String?,
      id: (json['id'] as num?)?.toInt(),
      categoryNew: json['categoryNew'] as String?,
      userDressRequestId: (json['userDressRequestId'] as num?)?.toInt(),
      taskQueueId: json['taskQueueId'] as String?,
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => ClassificationResultCategoryModel.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ClassificationResultModelImplToJson(
        _$ClassificationResultModelImpl instance) =>
    <String, dynamic>{
      'originalImageUrl': instance.originalImageUrl,
      'maskImageUrl': instance.maskImageUrl,
      'mainImageUrl': instance.mainImageUrl,
      'color': instance.color,
      'category': instance.category,
      'id': instance.id,
      'categoryNew': instance.categoryNew,
      'userDressRequestId': instance.userDressRequestId,
      'taskQueueId': instance.taskQueueId,
      'categories': instance.categories,
    };
