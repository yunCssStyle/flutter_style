import 'package:freezed_annotation/freezed_annotation.dart';

part 'closet_menu_model.freezed.dart';
part 'closet_menu_model.g.dart';

abstract class ClosetMenuModelBase {}

@freezed
class ClosetMenuModel extends ClosetMenuModelBase with _$ClosetMenuModel {
  const factory ClosetMenuModel({
    required int id,
    required int categoryId,
    required String dressType,
    int? productId,
    String? detailSiteUrl,
    int? userDressId,
    int? vtonRequestId,
    int? userDressRequestId,
    required String mainImageUrl,
    String? putOnImageUrl,
    String? type,
    String? inspectionStatus,
    String? fitRequestStatus,
    required bool verified,
    bool? activated,
    String? categoryName,
  }) = _ClosetMenuModel;

  factory ClosetMenuModel.fromJson(Map<String, dynamic> json) =>
      _$ClosetMenuModelFromJson(json);
}
