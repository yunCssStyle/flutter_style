// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'closet_menu_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClosetMenuModelImpl _$$ClosetMenuModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ClosetMenuModelImpl(
      id: (json['id'] as num).toInt(),
      categoryId: (json['categoryId'] as num).toInt(),
      dressType: json['dressType'] as String,
      productId: (json['productId'] as num?)?.toInt(),
      detailSiteUrl: json['detailSiteUrl'] as String?,
      userDressId: (json['userDressId'] as num?)?.toInt(),
      vtonRequestId: (json['vtonRequestId'] as num?)?.toInt(),
      userDressRequestId: (json['userDressRequestId'] as num?)?.toInt(),
      mainImageUrl: json['mainImageUrl'] as String,
      putOnImageUrl: json['putOnImageUrl'] as String?,
      type: json['type'] as String?,
      inspectionStatus: json['inspectionStatus'] as String?,
      fitRequestStatus: json['fitRequestStatus'] as String?,
      verified: json['verified'] as bool,
      activated: json['activated'] as bool?,
      categoryName: json['categoryName'] as String?,
    );

Map<String, dynamic> _$$ClosetMenuModelImplToJson(
        _$ClosetMenuModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'categoryId': instance.categoryId,
      'dressType': instance.dressType,
      'productId': instance.productId,
      'detailSiteUrl': instance.detailSiteUrl,
      'userDressId': instance.userDressId,
      'vtonRequestId': instance.vtonRequestId,
      'userDressRequestId': instance.userDressRequestId,
      'mainImageUrl': instance.mainImageUrl,
      'putOnImageUrl': instance.putOnImageUrl,
      'type': instance.type,
      'inspectionStatus': instance.inspectionStatus,
      'fitRequestStatus': instance.fitRequestStatus,
      'verified': instance.verified,
      'activated': instance.activated,
      'categoryName': instance.categoryName,
    };
