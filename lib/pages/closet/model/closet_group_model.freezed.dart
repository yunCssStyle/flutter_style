// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'closet_group_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ClosetGroupModel _$ClosetGroupModelFromJson(Map<String, dynamic> json) {
  return _ClosetGroupModel.fromJson(json);
}

/// @nodoc
mixin _$ClosetGroupModel {
  String get name => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  bool get isLoad => throw _privateConstructorUsedError;
  List<ClosetMenuModel> get closetList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClosetGroupModelCopyWith<ClosetGroupModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClosetGroupModelCopyWith<$Res> {
  factory $ClosetGroupModelCopyWith(
          ClosetGroupModel value, $Res Function(ClosetGroupModel) then) =
      _$ClosetGroupModelCopyWithImpl<$Res, ClosetGroupModel>;
  @useResult
  $Res call(
      {String name, int id, bool isLoad, List<ClosetMenuModel> closetList});
}

/// @nodoc
class _$ClosetGroupModelCopyWithImpl<$Res, $Val extends ClosetGroupModel>
    implements $ClosetGroupModelCopyWith<$Res> {
  _$ClosetGroupModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
    Object? isLoad = null,
    Object? closetList = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      isLoad: null == isLoad
          ? _value.isLoad
          : isLoad // ignore: cast_nullable_to_non_nullable
              as bool,
      closetList: null == closetList
          ? _value.closetList
          : closetList // ignore: cast_nullable_to_non_nullable
              as List<ClosetMenuModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClosetGroupModelImplCopyWith<$Res>
    implements $ClosetGroupModelCopyWith<$Res> {
  factory _$$ClosetGroupModelImplCopyWith(_$ClosetGroupModelImpl value,
          $Res Function(_$ClosetGroupModelImpl) then) =
      __$$ClosetGroupModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name, int id, bool isLoad, List<ClosetMenuModel> closetList});
}

/// @nodoc
class __$$ClosetGroupModelImplCopyWithImpl<$Res>
    extends _$ClosetGroupModelCopyWithImpl<$Res, _$ClosetGroupModelImpl>
    implements _$$ClosetGroupModelImplCopyWith<$Res> {
  __$$ClosetGroupModelImplCopyWithImpl(_$ClosetGroupModelImpl _value,
      $Res Function(_$ClosetGroupModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
    Object? isLoad = null,
    Object? closetList = null,
  }) {
    return _then(_$ClosetGroupModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      isLoad: null == isLoad
          ? _value.isLoad
          : isLoad // ignore: cast_nullable_to_non_nullable
              as bool,
      closetList: null == closetList
          ? _value._closetList
          : closetList // ignore: cast_nullable_to_non_nullable
              as List<ClosetMenuModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClosetGroupModelImpl implements _ClosetGroupModel {
  const _$ClosetGroupModelImpl(
      {required this.name,
      required this.id,
      required this.isLoad,
      required final List<ClosetMenuModel> closetList})
      : _closetList = closetList;

  factory _$ClosetGroupModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClosetGroupModelImplFromJson(json);

  @override
  final String name;
  @override
  final int id;
  @override
  final bool isLoad;
  final List<ClosetMenuModel> _closetList;
  @override
  List<ClosetMenuModel> get closetList {
    if (_closetList is EqualUnmodifiableListView) return _closetList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_closetList);
  }

  @override
  String toString() {
    return 'ClosetGroupModel(name: $name, id: $id, isLoad: $isLoad, closetList: $closetList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClosetGroupModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isLoad, isLoad) || other.isLoad == isLoad) &&
            const DeepCollectionEquality()
                .equals(other._closetList, _closetList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, id, isLoad,
      const DeepCollectionEquality().hash(_closetList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClosetGroupModelImplCopyWith<_$ClosetGroupModelImpl> get copyWith =>
      __$$ClosetGroupModelImplCopyWithImpl<_$ClosetGroupModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClosetGroupModelImplToJson(
      this,
    );
  }
}

abstract class _ClosetGroupModel implements ClosetGroupModel {
  const factory _ClosetGroupModel(
          {required final String name,
          required final int id,
          required final bool isLoad,
          required final List<ClosetMenuModel> closetList}) =
      _$ClosetGroupModelImpl;

  factory _ClosetGroupModel.fromJson(Map<String, dynamic> json) =
      _$ClosetGroupModelImpl.fromJson;

  @override
  String get name;
  @override
  int get id;
  @override
  bool get isLoad;
  @override
  List<ClosetMenuModel> get closetList;
  @override
  @JsonKey(ignore: true)
  _$$ClosetGroupModelImplCopyWith<_$ClosetGroupModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
