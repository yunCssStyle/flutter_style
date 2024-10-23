// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'closet_group_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClosetGroupModelImpl _$$ClosetGroupModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ClosetGroupModelImpl(
      name: json['name'] as String,
      id: (json['id'] as num).toInt(),
      isLoad: json['isLoad'] as bool,
      closetList: (json['closetList'] as List<dynamic>)
          .map((e) => ClosetMenuModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ClosetGroupModelImplToJson(
        _$ClosetGroupModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'isLoad': instance.isLoad,
      'closetList': instance.closetList,
    };
