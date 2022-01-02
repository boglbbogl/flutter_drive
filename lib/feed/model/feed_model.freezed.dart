// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'feed_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FeedModelTearOff {
  const _$FeedModelTearOff();

  _FeedModel call({required int index, required bool isShow}) {
    return _FeedModel(
      index: index,
      isShow: isShow,
    );
  }
}

/// @nodoc
const $FeedModel = _$FeedModelTearOff();

/// @nodoc
mixin _$FeedModel {
  int get index => throw _privateConstructorUsedError;
  bool get isShow => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FeedModelCopyWith<FeedModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedModelCopyWith<$Res> {
  factory $FeedModelCopyWith(FeedModel value, $Res Function(FeedModel) then) =
      _$FeedModelCopyWithImpl<$Res>;
  $Res call({int index, bool isShow});
}

/// @nodoc
class _$FeedModelCopyWithImpl<$Res> implements $FeedModelCopyWith<$Res> {
  _$FeedModelCopyWithImpl(this._value, this._then);

  final FeedModel _value;
  // ignore: unused_field
  final $Res Function(FeedModel) _then;

  @override
  $Res call({
    Object? index = freezed,
    Object? isShow = freezed,
  }) {
    return _then(_value.copyWith(
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      isShow: isShow == freezed
          ? _value.isShow
          : isShow // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$FeedModelCopyWith<$Res> implements $FeedModelCopyWith<$Res> {
  factory _$FeedModelCopyWith(
          _FeedModel value, $Res Function(_FeedModel) then) =
      __$FeedModelCopyWithImpl<$Res>;
  @override
  $Res call({int index, bool isShow});
}

/// @nodoc
class __$FeedModelCopyWithImpl<$Res> extends _$FeedModelCopyWithImpl<$Res>
    implements _$FeedModelCopyWith<$Res> {
  __$FeedModelCopyWithImpl(_FeedModel _value, $Res Function(_FeedModel) _then)
      : super(_value, (v) => _then(v as _FeedModel));

  @override
  _FeedModel get _value => super._value as _FeedModel;

  @override
  $Res call({
    Object? index = freezed,
    Object? isShow = freezed,
  }) {
    return _then(_FeedModel(
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      isShow: isShow == freezed
          ? _value.isShow
          : isShow // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_FeedModel implements _FeedModel {
  const _$_FeedModel({required this.index, required this.isShow});

  @override
  final int index;
  @override
  final bool isShow;

  @override
  String toString() {
    return 'FeedModel(index: $index, isShow: $isShow)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FeedModel &&
            const DeepCollectionEquality().equals(other.index, index) &&
            const DeepCollectionEquality().equals(other.isShow, isShow));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(index),
      const DeepCollectionEquality().hash(isShow));

  @JsonKey(ignore: true)
  @override
  _$FeedModelCopyWith<_FeedModel> get copyWith =>
      __$FeedModelCopyWithImpl<_FeedModel>(this, _$identity);
}

abstract class _FeedModel implements FeedModel {
  const factory _FeedModel({required int index, required bool isShow}) =
      _$_FeedModel;

  @override
  int get index;
  @override
  bool get isShow;
  @override
  @JsonKey(ignore: true)
  _$FeedModelCopyWith<_FeedModel> get copyWith =>
      throw _privateConstructorUsedError;
}
