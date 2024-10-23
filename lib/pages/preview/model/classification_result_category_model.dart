import 'package:freezed_annotation/freezed_annotation.dart';

part 'classification_result_category_model.freezed.dart';
part 'classification_result_category_model.g.dart';

abstract class ClassificationResultCategoryModelBase {}

class ClassificationResultCategoryModelBaseError
    extends ClassificationResultCategoryModelBase {}

@freezed
class ClassificationResultCategoryModel
    extends ClassificationResultCategoryModelBase
    with _$ClassificationResultCategoryModel {
  const factory ClassificationResultCategoryModel({
    int? id,
    String? type,
    String? name,
    int? depth,
    int? listOrder,
    String? nameFullNm,
  }) = _ClassificationResultCategoryModel;

  factory ClassificationResultCategoryModel.fromJson(
          Map<String, dynamic> json) =>
      _$ClassificationResultCategoryModelFromJson(json);
}
