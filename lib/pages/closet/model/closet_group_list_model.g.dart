// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'closet_group_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClosetGroupListModelImpl _$$ClosetGroupListModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ClosetGroupListModelImpl(
      closetGroupList: (json['closetGroupList'] as List<dynamic>)
          .map((e) => ClosetGroupModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ClosetGroupListModelImplToJson(
        _$ClosetGroupListModelImpl instance) =>
    <String, dynamic>{
      'closetGroupList': instance.closetGroupList,
    };
