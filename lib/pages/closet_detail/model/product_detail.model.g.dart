// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductDetailModelImpl _$$ProductDetailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductDetailModelImpl(
      id: (json['id'] as num).toInt(),
      nameKo: json['nameKo'] as String?,
      nameEn: json['nameEn'] as String?,
      detailSiteUrl: json['detailSiteUrl'] as String?,
      myItem: json['myItem'] as bool?,
      price: (json['price'] as num?)?.toDouble(),
      mainImageUrl: json['mainImageUrl'] as String?,
      listImageUrl: json['listImageUrl'] as String?,
      putOnImageUrl: json['putOnImageUrl'] as String?,
      brandid: (json['brandid'] as num?)?.toInt(),
      brandName: json['brandName'] as String?,
      fitOrder: (json['fitOrder'] as num?)?.toInt(),
      closetCategoryid: (json['closetCategoryid'] as num?)?.toInt(),
      type: json['type'] as String?,
      myWished: json['myWished'] as bool?,
      seasonTypes: json['seasonTypes'] as String?,
      colorType: json['colorType'] as String?,
      patternType: json['patternType'] as String?,
      dressType: json['dressType'] as String?,
      userDressId: (json['userDressId'] as num?)?.toInt(),
      categoryName: json['categoryName'] as String?,
      categoryIds: (json['categoryIds'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$$ProductDetailModelImplToJson(
        _$ProductDetailModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameKo': instance.nameKo,
      'nameEn': instance.nameEn,
      'detailSiteUrl': instance.detailSiteUrl,
      'myItem': instance.myItem,
      'price': instance.price,
      'mainImageUrl': instance.mainImageUrl,
      'listImageUrl': instance.listImageUrl,
      'putOnImageUrl': instance.putOnImageUrl,
      'brandid': instance.brandid,
      'brandName': instance.brandName,
      'fitOrder': instance.fitOrder,
      'closetCategoryid': instance.closetCategoryid,
      'type': instance.type,
      'myWished': instance.myWished,
      'seasonTypes': instance.seasonTypes,
      'colorType': instance.colorType,
      'patternType': instance.patternType,
      'dressType': instance.dressType,
      'userDressId': instance.userDressId,
      'categoryName': instance.categoryName,
      'categoryIds': instance.categoryIds,
    };
