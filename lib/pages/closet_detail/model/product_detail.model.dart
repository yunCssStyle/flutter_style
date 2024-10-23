import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_detail.model.freezed.dart';
part 'product_detail.model.g.dart';

abstract class ProductDetailModelBase {}

@freezed
class ProductDetailModel extends ProductDetailModelBase
    with _$ProductDetailModel {
  const factory ProductDetailModel({
    required int id,
    String? nameKo,
    String? nameEn,
    String? detailSiteUrl,
    bool? myItem,
    double? price,
    String? mainImageUrl,
    String? listImageUrl,
    String? putOnImageUrl,
    int? brandid,
    String? brandName,
    int? fitOrder,
    int? closetCategoryid,
    String? type,
    bool? myWished,
    String? seasonTypes,
    String? colorType,
    String? patternType,
    String? dressType,
    int? userDressId,
    String? categoryName,
    List<int>? categoryIds,
  }) = _ProductDetailModel;

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailModelFromJson(json);
}
