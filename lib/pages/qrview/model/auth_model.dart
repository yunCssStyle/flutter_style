import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_model.freezed.dart';
part 'auth_model.g.dart';

abstract class AuthBase {}

class AuthCheckLoading extends AuthBase {}

class AuthCheckSuccess extends AuthBase {}

class AuthCheckBLOCKED extends AuthBase {}

@freezed
class AuthModel extends AuthBase with _$AuthModel {
  const factory AuthModel({
    required String refreshToken,
    required String accessToken,
  }) = _AuthModel;
  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      _$AuthModelFromJson(json);
}

class AuthError extends AuthBase {
  final String? message;
  final String code;
  final String? detail;

  AuthError({
    this.message,
    required this.code,
    this.detail,
  });
}
