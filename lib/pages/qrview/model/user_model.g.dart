// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      activated: json['activated'] as bool?,
      email: json['email'] as String?,
      gender: json['gender'] as String?,
      id: (json['id'] as num?)?.toInt(),
      langKey: json['langKey'] as String?,
      login: json['login'] as String?,
      provider: json['provider'] as String?,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'activated': instance.activated,
      'email': instance.email,
      'gender': instance.gender,
      'id': instance.id,
      'langKey': instance.langKey,
      'login': instance.login,
      'provider': instance.provider,
    };
