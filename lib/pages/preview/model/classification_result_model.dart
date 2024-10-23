import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mirror_app/pages/preview/model/classification_result_category_model.dart';

part 'classification_result_model.freezed.dart';
part 'classification_result_model.g.dart';

abstract class ClassificationResultModelBase {}

class ClassificationResultModelBaseError
    extends ClassificationResultModelBase {}

@freezed
class ClassificationResultModel extends ClassificationResultModelBase
    with _$ClassificationResultModel {
  const factory ClassificationResultModel({
    String? originalImageUrl,
    String? maskImageUrl,
    String? mainImageUrl,
    String? color,
    String? category,
    int? id,
    String? categoryNew,
    int? userDressRequestId,
    String? taskQueueId,
    @Default([]) List<ClassificationResultCategoryModel> categories,
  }) = _ClassificationResultModel;

  factory ClassificationResultModel.fromJson(Map<String, dynamic> json) =>
      _$ClassificationResultModelFromJson(json);
}
