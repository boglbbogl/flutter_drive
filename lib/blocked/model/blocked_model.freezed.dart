// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'blocked_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ContentBlockedModel _$ContentBlockedModelFromJson(Map<String, dynamic> json) {
  return _ContentBlockedModel.fromJson(json);
}

/// @nodoc
class _$ContentBlockedModelTearOff {
  const _$ContentBlockedModelTearOff();

  _ContentBlockedModel call(
      {required String userKey,
      required String email,
      required String blockedDocKey,
      required String docKey,
      required String cause,
      required String category,
      required bool isCheck,
      @TimestampConverter() required DateTime createdAt}) {
    return _ContentBlockedModel(
      userKey: userKey,
      email: email,
      blockedDocKey: blockedDocKey,
      docKey: docKey,
      cause: cause,
      category: category,
      isCheck: isCheck,
      createdAt: createdAt,
    );
  }

  ContentBlockedModel fromJson(Map<String, Object?> json) {
    return ContentBlockedModel.fromJson(json);
  }
}

/// @nodoc
const $ContentBlockedModel = _$ContentBlockedModelTearOff();

/// @nodoc
mixin _$ContentBlockedModel {
  String get userKey => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get blockedDocKey => throw _privateConstructorUsedError;
  String get docKey => throw _privateConstructorUsedError;
  String get cause => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  bool get isCheck => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContentBlockedModelCopyWith<ContentBlockedModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentBlockedModelCopyWith<$Res> {
  factory $ContentBlockedModelCopyWith(
          ContentBlockedModel value, $Res Function(ContentBlockedModel) then) =
      _$ContentBlockedModelCopyWithImpl<$Res>;
  $Res call(
      {String userKey,
      String email,
      String blockedDocKey,
      String docKey,
      String cause,
      String category,
      bool isCheck,
      @TimestampConverter() DateTime createdAt});
}

/// @nodoc
class _$ContentBlockedModelCopyWithImpl<$Res>
    implements $ContentBlockedModelCopyWith<$Res> {
  _$ContentBlockedModelCopyWithImpl(this._value, this._then);

  final ContentBlockedModel _value;
  // ignore: unused_field
  final $Res Function(ContentBlockedModel) _then;

  @override
  $Res call({
    Object? userKey = freezed,
    Object? email = freezed,
    Object? blockedDocKey = freezed,
    Object? docKey = freezed,
    Object? cause = freezed,
    Object? category = freezed,
    Object? isCheck = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      userKey: userKey == freezed
          ? _value.userKey
          : userKey // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      blockedDocKey: blockedDocKey == freezed
          ? _value.blockedDocKey
          : blockedDocKey // ignore: cast_nullable_to_non_nullable
              as String,
      docKey: docKey == freezed
          ? _value.docKey
          : docKey // ignore: cast_nullable_to_non_nullable
              as String,
      cause: cause == freezed
          ? _value.cause
          : cause // ignore: cast_nullable_to_non_nullable
              as String,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      isCheck: isCheck == freezed
          ? _value.isCheck
          : isCheck // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$ContentBlockedModelCopyWith<$Res>
    implements $ContentBlockedModelCopyWith<$Res> {
  factory _$ContentBlockedModelCopyWith(_ContentBlockedModel value,
          $Res Function(_ContentBlockedModel) then) =
      __$ContentBlockedModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String userKey,
      String email,
      String blockedDocKey,
      String docKey,
      String cause,
      String category,
      bool isCheck,
      @TimestampConverter() DateTime createdAt});
}

/// @nodoc
class __$ContentBlockedModelCopyWithImpl<$Res>
    extends _$ContentBlockedModelCopyWithImpl<$Res>
    implements _$ContentBlockedModelCopyWith<$Res> {
  __$ContentBlockedModelCopyWithImpl(
      _ContentBlockedModel _value, $Res Function(_ContentBlockedModel) _then)
      : super(_value, (v) => _then(v as _ContentBlockedModel));

  @override
  _ContentBlockedModel get _value => super._value as _ContentBlockedModel;

  @override
  $Res call({
    Object? userKey = freezed,
    Object? email = freezed,
    Object? blockedDocKey = freezed,
    Object? docKey = freezed,
    Object? cause = freezed,
    Object? category = freezed,
    Object? isCheck = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_ContentBlockedModel(
      userKey: userKey == freezed
          ? _value.userKey
          : userKey // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      blockedDocKey: blockedDocKey == freezed
          ? _value.blockedDocKey
          : blockedDocKey // ignore: cast_nullable_to_non_nullable
              as String,
      docKey: docKey == freezed
          ? _value.docKey
          : docKey // ignore: cast_nullable_to_non_nullable
              as String,
      cause: cause == freezed
          ? _value.cause
          : cause // ignore: cast_nullable_to_non_nullable
              as String,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      isCheck: isCheck == freezed
          ? _value.isCheck
          : isCheck // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ContentBlockedModel extends _ContentBlockedModel {
  const _$_ContentBlockedModel(
      {required this.userKey,
      required this.email,
      required this.blockedDocKey,
      required this.docKey,
      required this.cause,
      required this.category,
      required this.isCheck,
      @TimestampConverter() required this.createdAt})
      : super._();

  factory _$_ContentBlockedModel.fromJson(Map<String, dynamic> json) =>
      _$$_ContentBlockedModelFromJson(json);

  @override
  final String userKey;
  @override
  final String email;
  @override
  final String blockedDocKey;
  @override
  final String docKey;
  @override
  final String cause;
  @override
  final String category;
  @override
  final bool isCheck;
  @override
  @TimestampConverter()
  final DateTime createdAt;

  @override
  String toString() {
    return 'ContentBlockedModel(userKey: $userKey, email: $email, blockedDocKey: $blockedDocKey, docKey: $docKey, cause: $cause, category: $category, isCheck: $isCheck, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ContentBlockedModel &&
            const DeepCollectionEquality().equals(other.userKey, userKey) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality()
                .equals(other.blockedDocKey, blockedDocKey) &&
            const DeepCollectionEquality().equals(other.docKey, docKey) &&
            const DeepCollectionEquality().equals(other.cause, cause) &&
            const DeepCollectionEquality().equals(other.category, category) &&
            const DeepCollectionEquality().equals(other.isCheck, isCheck) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userKey),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(blockedDocKey),
      const DeepCollectionEquality().hash(docKey),
      const DeepCollectionEquality().hash(cause),
      const DeepCollectionEquality().hash(category),
      const DeepCollectionEquality().hash(isCheck),
      const DeepCollectionEquality().hash(createdAt));

  @JsonKey(ignore: true)
  @override
  _$ContentBlockedModelCopyWith<_ContentBlockedModel> get copyWith =>
      __$ContentBlockedModelCopyWithImpl<_ContentBlockedModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ContentBlockedModelToJson(this);
  }
}

abstract class _ContentBlockedModel extends ContentBlockedModel {
  const factory _ContentBlockedModel(
          {required String userKey,
          required String email,
          required String blockedDocKey,
          required String docKey,
          required String cause,
          required String category,
          required bool isCheck,
          @TimestampConverter() required DateTime createdAt}) =
      _$_ContentBlockedModel;
  const _ContentBlockedModel._() : super._();

  factory _ContentBlockedModel.fromJson(Map<String, dynamic> json) =
      _$_ContentBlockedModel.fromJson;

  @override
  String get userKey;
  @override
  String get email;
  @override
  String get blockedDocKey;
  @override
  String get docKey;
  @override
  String get cause;
  @override
  String get category;
  @override
  bool get isCheck;
  @override
  @TimestampConverter()
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$ContentBlockedModelCopyWith<_ContentBlockedModel> get copyWith =>
      throw _privateConstructorUsedError;
}
