// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'classification_result_category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ClassificationResultCategoryModel _$ClassificationResultCategoryModelFromJson(
    Map<String, dynamic> json) {
  return _ClassificationResultCategoryModel.fromJson(json);
}

/// @nodoc
mixin _$ClassificationResultCategoryModel {
  int? get id => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  int? get depth => throw _privateConstructorUsedError;
  int? get listOrder => throw _privateConstructorUsedError;
  String? get nameFullNm => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClassificationResultCategoryModelCopyWith<ClassificationResultCategoryModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClassificationResultCategoryModelCopyWith<$Res> {
  factory $ClassificationResultCategoryModelCopyWith(
          ClassificationResultCategoryModel value,
          $Res Function(ClassificationResultCategoryModel) then) =
      _$ClassificationResultCategoryModelCopyWithImpl<$Res,
          ClassificationResultCategoryModel>;
  @useResult
  $Res call(
      {int? id,
      String? type,
      String? name,
      int? depth,
      int? listOrder,
      String? nameFullNm});
}

/// @nodoc
class _$ClassificationResultCategoryModelCopyWithImpl<$Res,
        $Val extends ClassificationResultCategoryModel>
    implements $ClassificationResultCategoryModelCopyWith<$Res> {
  _$ClassificationResultCategoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? name = freezed,
    Object? depth = freezed,
    Object? listOrder = freezed,
    Object? nameFullNm = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      depth: freezed == depth
          ? _value.depth
          : depth // ignore: cast_nullable_to_non_nullable
              as int?,
      listOrder: freezed == listOrder
          ? _value.listOrder
          : listOrder // ignore: cast_nullable_to_non_nullable
              as int?,
      nameFullNm: freezed == nameFullNm
          ? _value.nameFullNm
          : nameFullNm // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClassificationResultCategoryModelImplCopyWith<$Res>
    implements $ClassificationResultCategoryModelCopyWith<$Res> {
  factory _$$ClassificationResultCategoryModelImplCopyWith(
          _$ClassificationResultCategoryModelImpl value,
          $Res Function(_$ClassificationResultCategoryModelImpl) then) =
      __$$ClassificationResultCategoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? type,
      String? name,
      int? depth,
      int? listOrder,
      String? nameFullNm});
}

/// @nodoc
class __$$ClassificationResultCategoryModelImplCopyWithImpl<$Res>
    extends _$ClassificationResultCategoryModelCopyWithImpl<$Res,
        _$ClassificationResultCategoryModelImpl>
    implements _$$ClassificationResultCategoryModelImplCopyWith<$Res> {
  __$$ClassificationResultCategoryModelImplCopyWithImpl(
      _$ClassificationResultCategoryModelImpl _value,
      $Res Function(_$ClassificationResultCategoryModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? name = freezed,
    Object? depth = freezed,
    Object? listOrder = freezed,
    Object? nameFullNm = freezed,
  }) {
    return _then(_$ClassificationResultCategoryModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      depth: freezed == depth
          ? _value.depth
          : depth // ignore: cast_nullable_to_non_nullable
              as int?,
      listOrder: freezed == listOrder
          ? _value.listOrder
          : listOrder // ignore: cast_nullable_to_non_nullable
              as int?,
      nameFullNm: freezed == nameFullNm
          ? _value.nameFullNm
          : nameFullNm // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClassificationResultCategoryModelImpl
    implements _ClassificationResultCategoryModel {
  const _$ClassificationResultCategoryModelImpl(
      {this.id,
      this.type,
      this.name,
      this.depth,
      this.listOrder,
      this.nameFullNm});

  factory _$ClassificationResultCategoryModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ClassificationResultCategoryModelImplFromJson(json);

  @override
  final int? id;
  @override
  final String? type;
  @override
  final String? name;
  @override
  final int? depth;
  @override
  final int? listOrder;
  @override
  final String? nameFullNm;

  @override
  String toString() {
    return 'ClassificationResultCategoryModel(id: $id, type: $type, name: $name, depth: $depth, listOrder: $listOrder, nameFullNm: $nameFullNm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClassificationResultCategoryModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.depth, depth) || other.depth == depth) &&
            (identical(other.listOrder, listOrder) ||
                other.listOrder == listOrder) &&
            (identical(other.nameFullNm, nameFullNm) ||
                other.nameFullNm == nameFullNm));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, type, name, depth, listOrder, nameFullNm);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClassificationResultCategoryModelImplCopyWith<
          _$ClassificationResultCategoryModelImpl>
      get copyWith => __$$ClassificationResultCategoryModelImplCopyWithImpl<
          _$ClassificationResultCategoryModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClassificationResultCategoryModelImplToJson(
      this,
    );
  }
}

abstract class _ClassificationResultCategoryModel
    implements ClassificationResultCategoryModel {
  const factory _ClassificationResultCategoryModel(
      {final int? id,
      final String? type,
      final String? name,
      final int? depth,
      final int? listOrder,
      final String? nameFullNm}) = _$ClassificationResultCategoryModelImpl;

  factory _ClassificationResultCategoryModel.fromJson(
          Map<String, dynamic> json) =
      _$ClassificationResultCategoryModelImpl.fromJson;

  @override
  int? get id;
  @override
  String? get type;
  @override
  String? get name;
  @override
  int? get depth;
  @override
  int? get listOrder;
  @override
  String? get nameFullNm;
  @override
  @JsonKey(ignore: true)
  _$$ClassificationResultCategoryModelImplCopyWith<
          _$ClassificationResultCategoryModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
