// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_res_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SignInResModel _$SignInResModelFromJson(Map<String, dynamic> json) {
  return _SignInResModel.fromJson(json);
}

/// @nodoc
mixin _$SignInResModel {
  String get mirrorDeviceId => throw _privateConstructorUsedError;
  String get mirrorUserId => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignInResModelCopyWith<SignInResModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInResModelCopyWith<$Res> {
  factory $SignInResModelCopyWith(
          SignInResModel value, $Res Function(SignInResModel) then) =
      _$SignInResModelCopyWithImpl<$Res, SignInResModel>;
  @useResult
  $Res call({String mirrorDeviceId, String mirrorUserId, String gender});
}

/// @nodoc
class _$SignInResModelCopyWithImpl<$Res, $Val extends SignInResModel>
    implements $SignInResModelCopyWith<$Res> {
  _$SignInResModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mirrorDeviceId = null,
    Object? mirrorUserId = null,
    Object? gender = null,
  }) {
    return _then(_value.copyWith(
      mirrorDeviceId: null == mirrorDeviceId
          ? _value.mirrorDeviceId
          : mirrorDeviceId // ignore: cast_nullable_to_non_nullable
              as String,
      mirrorUserId: null == mirrorUserId
          ? _value.mirrorUserId
          : mirrorUserId // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignInResModelImplCopyWith<$Res>
    implements $SignInResModelCopyWith<$Res> {
  factory _$$SignInResModelImplCopyWith(_$SignInResModelImpl value,
          $Res Function(_$SignInResModelImpl) then) =
      __$$SignInResModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String mirrorDeviceId, String mirrorUserId, String gender});
}

/// @nodoc
class __$$SignInResModelImplCopyWithImpl<$Res>
    extends _$SignInResModelCopyWithImpl<$Res, _$SignInResModelImpl>
    implements _$$SignInResModelImplCopyWith<$Res> {
  __$$SignInResModelImplCopyWithImpl(
      _$SignInResModelImpl _value, $Res Function(_$SignInResModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mirrorDeviceId = null,
    Object? mirrorUserId = null,
    Object? gender = null,
  }) {
    return _then(_$SignInResModelImpl(
      mirrorDeviceId: null == mirrorDeviceId
          ? _value.mirrorDeviceId
          : mirrorDeviceId // ignore: cast_nullable_to_non_nullable
              as String,
      mirrorUserId: null == mirrorUserId
          ? _value.mirrorUserId
          : mirrorUserId // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SignInResModelImpl implements _SignInResModel {
  const _$SignInResModelImpl(
      {required this.mirrorDeviceId,
      required this.mirrorUserId,
      required this.gender});

  factory _$SignInResModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignInResModelImplFromJson(json);

  @override
  final String mirrorDeviceId;
  @override
  final String mirrorUserId;
  @override
  final String gender;

  @override
  String toString() {
    return 'SignInResModel(mirrorDeviceId: $mirrorDeviceId, mirrorUserId: $mirrorUserId, gender: $gender)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInResModelImpl &&
            (identical(other.mirrorDeviceId, mirrorDeviceId) ||
                other.mirrorDeviceId == mirrorDeviceId) &&
            (identical(other.mirrorUserId, mirrorUserId) ||
                other.mirrorUserId == mirrorUserId) &&
            (identical(other.gender, gender) || other.gender == gender));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, mirrorDeviceId, mirrorUserId, gender);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInResModelImplCopyWith<_$SignInResModelImpl> get copyWith =>
      __$$SignInResModelImplCopyWithImpl<_$SignInResModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignInResModelImplToJson(
      this,
    );
  }
}

abstract class _SignInResModel implements SignInResModel {
  const factory _SignInResModel(
      {required final String mirrorDeviceId,
      required final String mirrorUserId,
      required final String gender}) = _$SignInResModelImpl;

  factory _SignInResModel.fromJson(Map<String, dynamic> json) =
      _$SignInResModelImpl.fromJson;

  @override
  String get mirrorDeviceId;
  @override
  String get mirrorUserId;
  @override
  String get gender;
  @override
  @JsonKey(ignore: true)
  _$$SignInResModelImplCopyWith<_$SignInResModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
