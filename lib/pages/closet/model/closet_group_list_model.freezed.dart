// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'closet_group_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ClosetGroupListModel _$ClosetGroupListModelFromJson(Map<String, dynamic> json) {
  return _ClosetGroupListModel.fromJson(json);
}

/// @nodoc
mixin _$ClosetGroupListModel {
  List<ClosetGroupModel> get closetGroupList =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClosetGroupListModelCopyWith<ClosetGroupListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClosetGroupListModelCopyWith<$Res> {
  factory $ClosetGroupListModelCopyWith(ClosetGroupListModel value,
          $Res Function(ClosetGroupListModel) then) =
      _$ClosetGroupListModelCopyWithImpl<$Res, ClosetGroupListModel>;
  @useResult
  $Res call({List<ClosetGroupModel> closetGroupList});
}

/// @nodoc
class _$ClosetGroupListModelCopyWithImpl<$Res,
        $Val extends ClosetGroupListModel>
    implements $ClosetGroupListModelCopyWith<$Res> {
  _$ClosetGroupListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? closetGroupList = null,
  }) {
    return _then(_value.copyWith(
      closetGroupList: null == closetGroupList
          ? _value.closetGroupList
          : closetGroupList // ignore: cast_nullable_to_non_nullable
              as List<ClosetGroupModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClosetGroupListModelImplCopyWith<$Res>
    implements $ClosetGroupListModelCopyWith<$Res> {
  factory _$$ClosetGroupListModelImplCopyWith(_$ClosetGroupListModelImpl value,
          $Res Function(_$ClosetGroupListModelImpl) then) =
      __$$ClosetGroupListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ClosetGroupModel> closetGroupList});
}

/// @nodoc
class __$$ClosetGroupListModelImplCopyWithImpl<$Res>
    extends _$ClosetGroupListModelCopyWithImpl<$Res, _$ClosetGroupListModelImpl>
    implements _$$ClosetGroupListModelImplCopyWith<$Res> {
  __$$ClosetGroupListModelImplCopyWithImpl(_$ClosetGroupListModelImpl _value,
      $Res Function(_$ClosetGroupListModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? closetGroupList = null,
  }) {
    return _then(_$ClosetGroupListModelImpl(
      closetGroupList: null == closetGroupList
          ? _value._closetGroupList
          : closetGroupList // ignore: cast_nullable_to_non_nullable
              as List<ClosetGroupModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClosetGroupListModelImpl implements _ClosetGroupListModel {
  const _$ClosetGroupListModelImpl(
      {required final List<ClosetGroupModel> closetGroupList})
      : _closetGroupList = closetGroupList;

  factory _$ClosetGroupListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClosetGroupListModelImplFromJson(json);

  final List<ClosetGroupModel> _closetGroupList;
  @override
  List<ClosetGroupModel> get closetGroupList {
    if (_closetGroupList is EqualUnmodifiableListView) return _closetGroupList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_closetGroupList);
  }

  @override
  String toString() {
    return 'ClosetGroupListModel(closetGroupList: $closetGroupList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClosetGroupListModelImpl &&
            const DeepCollectionEquality()
                .equals(other._closetGroupList, _closetGroupList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_closetGroupList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClosetGroupListModelImplCopyWith<_$ClosetGroupListModelImpl>
      get copyWith =>
          __$$ClosetGroupListModelImplCopyWithImpl<_$ClosetGroupListModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClosetGroupListModelImplToJson(
      this,
    );
  }
}

abstract class _ClosetGroupListModel implements ClosetGroupListModel {
  const factory _ClosetGroupListModel(
          {required final List<ClosetGroupModel> closetGroupList}) =
      _$ClosetGroupListModelImpl;

  factory _ClosetGroupListModel.fromJson(Map<String, dynamic> json) =
      _$ClosetGroupListModelImpl.fromJson;

  @override
  List<ClosetGroupModel> get closetGroupList;
  @override
  @JsonKey(ignore: true)
  _$$ClosetGroupListModelImplCopyWith<_$ClosetGroupListModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
