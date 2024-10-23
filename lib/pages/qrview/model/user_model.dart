import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

abstract class UserModelBase {}

class UserModelInit extends UserModelBase {}

class UserModelLoading extends UserModelBase {}

class UserModelBaseError extends UserModelBase {
  final String message;

  UserModelBaseError({
    required this.message,
  });
}

@freezed
class UserModel extends UserModelBase with _$UserModel {
  const factory UserModel({
    bool? activated,
    String? email,
    String? gender,
    int? id,
    String? langKey,
    String? login,
    String? provider,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
