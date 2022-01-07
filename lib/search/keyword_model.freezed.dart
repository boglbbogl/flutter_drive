// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'keyword_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

KeywordModel _$KeywordModelFromJson(Map<String, dynamic> json) {
  return _KeywordModel.fromJson(json);
}

/// @nodoc
class _$KeywordModelTearOff {
  const _$KeywordModelTearOff();

  _KeywordModel call(
      {required List<String> srcKeyword, required List<String> tagKeyword}) {
    return _KeywordModel(
      srcKeyword: srcKeyword,
      tagKeyword: tagKeyword,
    );
  }

  KeywordModel fromJson(Map<String, Object?> json) {
    return KeywordModel.fromJson(json);
  }
}

/// @nodoc
const $KeywordModel = _$KeywordModelTearOff();

/// @nodoc
mixin _$KeywordModel {
  List<String> get srcKeyword => throw _privateConstructorUsedError;
  List<String> get tagKeyword => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KeywordModelCopyWith<KeywordModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KeywordModelCopyWith<$Res> {
  factory $KeywordModelCopyWith(
          KeywordModel value, $Res Function(KeywordModel) then) =
      _$KeywordModelCopyWithImpl<$Res>;
  $Res call({List<String> srcKeyword, List<String> tagKeyword});
}

/// @nodoc
class _$KeywordModelCopyWithImpl<$Res> implements $KeywordModelCopyWith<$Res> {
  _$KeywordModelCopyWithImpl(this._value, this._then);

  final KeywordModel _value;
  // ignore: unused_field
  final $Res Function(KeywordModel) _then;

  @override
  $Res call({
    Object? srcKeyword = freezed,
    Object? tagKeyword = freezed,
  }) {
    return _then(_value.copyWith(
      srcKeyword: srcKeyword == freezed
          ? _value.srcKeyword
          : srcKeyword // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tagKeyword: tagKeyword == freezed
          ? _value.tagKeyword
          : tagKeyword // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$KeywordModelCopyWith<$Res>
    implements $KeywordModelCopyWith<$Res> {
  factory _$KeywordModelCopyWith(
          _KeywordModel value, $Res Function(_KeywordModel) then) =
      __$KeywordModelCopyWithImpl<$Res>;
  @override
  $Res call({List<String> srcKeyword, List<String> tagKeyword});
}

/// @nodoc
class __$KeywordModelCopyWithImpl<$Res> extends _$KeywordModelCopyWithImpl<$Res>
    implements _$KeywordModelCopyWith<$Res> {
  __$KeywordModelCopyWithImpl(
      _KeywordModel _value, $Res Function(_KeywordModel) _then)
      : super(_value, (v) => _then(v as _KeywordModel));

  @override
  _KeywordModel get _value => super._value as _KeywordModel;

  @override
  $Res call({
    Object? srcKeyword = freezed,
    Object? tagKeyword = freezed,
  }) {
    return _then(_KeywordModel(
      srcKeyword: srcKeyword == freezed
          ? _value.srcKeyword
          : srcKeyword // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tagKeyword: tagKeyword == freezed
          ? _value.tagKeyword
          : tagKeyword // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_KeywordModel implements _KeywordModel {
  const _$_KeywordModel({required this.srcKeyword, required this.tagKeyword});

  factory _$_KeywordModel.fromJson(Map<String, dynamic> json) =>
      _$$_KeywordModelFromJson(json);

  @override
  final List<String> srcKeyword;
  @override
  final List<String> tagKeyword;

  @override
  String toString() {
    return 'KeywordModel(srcKeyword: $srcKeyword, tagKeyword: $tagKeyword)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _KeywordModel &&
            const DeepCollectionEquality()
                .equals(other.srcKeyword, srcKeyword) &&
            const DeepCollectionEquality()
                .equals(other.tagKeyword, tagKeyword));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(srcKeyword),
      const DeepCollectionEquality().hash(tagKeyword));

  @JsonKey(ignore: true)
  @override
  _$KeywordModelCopyWith<_KeywordModel> get copyWith =>
      __$KeywordModelCopyWithImpl<_KeywordModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_KeywordModelToJson(this);
  }
}

abstract class _KeywordModel implements KeywordModel {
  const factory _KeywordModel(
      {required List<String> srcKeyword,
      required List<String> tagKeyword}) = _$_KeywordModel;

  factory _KeywordModel.fromJson(Map<String, dynamic> json) =
      _$_KeywordModel.fromJson;

  @override
  List<String> get srcKeyword;
  @override
  List<String> get tagKeyword;
  @override
  @JsonKey(ignore: true)
  _$KeywordModelCopyWith<_KeywordModel> get copyWith =>
      throw _privateConstructorUsedError;
}
