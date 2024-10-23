// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'closet_product_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ClosetProductModel _$ClosetProductModelFromJson(Map<String, dynamic> json) {
  return _ClosetProductModel.fromJson(json);
}

/// @nodoc
mixin _$ClosetProductModel {
  String? get type => throw _privateConstructorUsedError;
  ClosetDetailModel? get closetModel => throw _privateConstructorUsedError;
  ProductDetailModel? get productModel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClosetProductModelCopyWith<ClosetProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClosetProductModelCopyWith<$Res> {
  factory $ClosetProductModelCopyWith(
          ClosetProductModel value, $Res Function(ClosetProductModel) then) =
      _$ClosetProductModelCopyWithImpl<$Res, ClosetProductModel>;
  @useResult
  $Res call(
      {String? type,
      ClosetDetailModel? closetModel,
      ProductDetailModel? productModel});

  $ClosetDetailModelCopyWith<$Res>? get closetModel;
  $ProductDetailModelCopyWith<$Res>? get productModel;
}

/// @nodoc
class _$ClosetProductModelCopyWithImpl<$Res, $Val extends ClosetProductModel>
    implements $ClosetProductModelCopyWith<$Res> {
  _$ClosetProductModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? closetModel = freezed,
    Object? productModel = freezed,
  }) {
    return _then(_value.copyWith(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      closetModel: freezed == closetModel
          ? _value.closetModel
          : closetModel // ignore: cast_nullable_to_non_nullable
              as ClosetDetailModel?,
      productModel: freezed == productModel
          ? _value.productModel
          : productModel // ignore: cast_nullable_to_non_nullable
              as ProductDetailModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ClosetDetailModelCopyWith<$Res>? get closetModel {
    if (_value.closetModel == null) {
      return null;
    }

    return $ClosetDetailModelCopyWith<$Res>(_value.closetModel!, (value) {
      return _then(_value.copyWith(closetModel: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductDetailModelCopyWith<$Res>? get productModel {
    if (_value.productModel == null) {
      return null;
    }

    return $ProductDetailModelCopyWith<$Res>(_value.productModel!, (value) {
      return _then(_value.copyWith(productModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ClosetProductModelImplCopyWith<$Res>
    implements $ClosetProductModelCopyWith<$Res> {
  factory _$$ClosetProductModelImplCopyWith(_$ClosetProductModelImpl value,
          $Res Function(_$ClosetProductModelImpl) then) =
      __$$ClosetProductModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? type,
      ClosetDetailModel? closetModel,
      ProductDetailModel? productModel});

  @override
  $ClosetDetailModelCopyWith<$Res>? get closetModel;
  @override
  $ProductDetailModelCopyWith<$Res>? get productModel;
}

/// @nodoc
class __$$ClosetProductModelImplCopyWithImpl<$Res>
    extends _$ClosetProductModelCopyWithImpl<$Res, _$ClosetProductModelImpl>
    implements _$$ClosetProductModelImplCopyWith<$Res> {
  __$$ClosetProductModelImplCopyWithImpl(_$ClosetProductModelImpl _value,
      $Res Function(_$ClosetProductModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? closetModel = freezed,
    Object? productModel = freezed,
  }) {
    return _then(_$ClosetProductModelImpl(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      closetModel: freezed == closetModel
          ? _value.closetModel
          : closetModel // ignore: cast_nullable_to_non_nullable
              as ClosetDetailModel?,
      productModel: freezed == productModel
          ? _value.productModel
          : productModel // ignore: cast_nullable_to_non_nullable
              as ProductDetailModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClosetProductModelImpl implements _ClosetProductModel {
  const _$ClosetProductModelImpl(
      {this.type, this.closetModel, this.productModel});

  factory _$ClosetProductModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClosetProductModelImplFromJson(json);

  @override
  final String? type;
  @override
  final ClosetDetailModel? closetModel;
  @override
  final ProductDetailModel? productModel;

  @override
  String toString() {
    return 'ClosetProductModel(type: $type, closetModel: $closetModel, productModel: $productModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClosetProductModelImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.closetModel, closetModel) ||
                other.closetModel == closetModel) &&
            (identical(other.productModel, productModel) ||
                other.productModel == productModel));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, closetModel, productModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClosetProductModelImplCopyWith<_$ClosetProductModelImpl> get copyWith =>
      __$$ClosetProductModelImplCopyWithImpl<_$ClosetProductModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClosetProductModelImplToJson(
      this,
    );
  }
}

abstract class _ClosetProductModel implements ClosetProductModel {
  const factory _ClosetProductModel(
      {final String? type,
      final ClosetDetailModel? closetModel,
      final ProductDetailModel? productModel}) = _$ClosetProductModelImpl;

  factory _ClosetProductModel.fromJson(Map<String, dynamic> json) =
      _$ClosetProductModelImpl.fromJson;

  @override
  String? get type;
  @override
  ClosetDetailModel? get closetModel;
  @override
  ProductDetailModel? get productModel;
  @override
  @JsonKey(ignore: true)
  _$$ClosetProductModelImplCopyWith<_$ClosetProductModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
