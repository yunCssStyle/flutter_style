import 'package:freezed_annotation/freezed_annotation.dart';

import 'closet_menu_model.dart';

part 'closet_group_model.freezed.dart';
part 'closet_group_model.g.dart';

abstract class ClosetGroupModelBase {}

@freezed
class ClosetGroupModel extends ClosetGroupModelBase with _$ClosetGroupModel {
  const factory ClosetGroupModel({
    required String name,
    required int id,
    required bool isLoad,
    required List<ClosetMenuModel> closetList,
  }) = _ClosetGroupModel;

  factory ClosetGroupModel.fromJson(Map<String, dynamic> json) =>
      _$ClosetGroupModelFromJson(json);
}
