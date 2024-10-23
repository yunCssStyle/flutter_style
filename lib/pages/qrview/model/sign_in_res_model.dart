import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_res_model.freezed.dart';
part 'sign_in_res_model.g.dart';

@freezed
class SignInResModel with _$SignInResModel {
  const factory SignInResModel({
    required String mirrorDeviceId,
    required String mirrorUserId,
    required String gender,
  }) = _SignInResModel;
  factory SignInResModel.fromJson(Map<String, dynamic> json) =>
      _$SignInResModelFromJson(json);
}
