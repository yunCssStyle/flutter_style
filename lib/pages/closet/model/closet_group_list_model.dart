import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mirror_app/pages/closet/model/closet_group_model.dart';

part 'closet_group_list_model.freezed.dart';
part 'closet_group_list_model.g.dart';

abstract class ClosetGroupListModelBase {}

class ClosetGroupListLoading extends ClosetGroupListModelBase {}

class ClosetGroupListModelBaseError extends ClosetGroupListModelBase {}

@freezed
class ClosetGroupListModel extends ClosetGroupListModelBase
    with _$ClosetGroupListModel {
  const factory ClosetGroupListModel({
    required List<ClosetGroupModel> closetGroupList,
  }) = _ClosetGroupListModel;

  factory ClosetGroupListModel.fromJson(Map<String, dynamic> json) =>
      _$ClosetGroupListModelFromJson(json);
}
