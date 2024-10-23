import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mirror_app/pages/closet_detail/model/closet_detail_model.dart';
import 'package:mirror_app/pages/closet_detail/model/product_detail.model.dart';

part 'closet_product_item_model.freezed.dart';
part 'closet_product_item_model.g.dart';

abstract class ClosetProductModelBase {}

@freezed
class ClosetProductModel extends ClosetProductModelBase
    with _$ClosetProductModel {
  const factory ClosetProductModel({
    String? type,
    ClosetDetailModel? closetModel,
    ProductDetailModel? productModel,
  }) = _ClosetProductModel;

  factory ClosetProductModel.fromJson(Map<String, dynamic> json) =>
      _$ClosetProductModelFromJson(json);
}
