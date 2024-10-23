import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dress_model.freezed.dart';
part 'user_dress_model.g.dart';

abstract class UserDressModelBase {}

class UserDressModelLoading extends UserDressModelBase {}

class UserDressModelBaseError extends UserDressModelBase {}

@freezed
class UserDressModel extends UserDressModelBase with _$UserDressModel {
  const factory UserDressModel({
    String? gender,
    bool? adjusted,
    int? categoryId,
    List<int>? categoryIds,
    int? closetCategoryId,
    String? colorType,
    String? lengthType,
    String? mainImageUrl,
    String? maskImageUrl,
    String? necklineType,
    String? originalImageUrl,
    String? patternType,
    String? seasonTypes,
    String? sleeveType,
    int? userDressRequestId,
  }) = _UserDressModel;

  factory UserDressModel.fromJson(Map<String, dynamic> json) =>
      _$UserDressModelFromJson(json);
}
