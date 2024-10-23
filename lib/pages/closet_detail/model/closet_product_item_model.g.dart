// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'closet_product_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClosetProductModelImpl _$$ClosetProductModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ClosetProductModelImpl(
      type: json['type'] as String?,
      closetModel: json['closetModel'] == null
          ? null
          : ClosetDetailModel.fromJson(
              json['closetModel'] as Map<String, dynamic>),
      productModel: json['productModel'] == null
          ? null
          : ProductDetailModel.fromJson(
              json['productModel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ClosetProductModelImplToJson(
        _$ClosetProductModelImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'closetModel': instance.closetModel,
      'productModel': instance.productModel,
    };
