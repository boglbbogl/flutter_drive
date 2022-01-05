// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'comment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CommentModel _$CommentModelFromJson(Map<String, dynamic> json) {
  return _CommentModel.fromJson(json);
}

/// @nodoc
class _$CommentModelTearOff {
  const _$CommentModelTearOff();

  _CommentModel call(
      {required String userKey,
      required String docKey,
      required String comment,
      required int isMoreCount,
      @TimestampConverter() required DateTime createdAt,
      @TimestampConverter() required DateTime updatedAt}) {
    return _CommentModel(
      userKey: userKey,
      docKey: docKey,
      comment: comment,
      isMoreCount: isMoreCount,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  CommentModel fromJson(Map<String, Object?> json) {
    return CommentModel.fromJson(json);
  }
}

/// @nodoc
const $CommentModel = _$CommentModelTearOff();

/// @nodoc
mixin _$CommentModel {
  String get userKey => throw _privateConstructorUsedError;
  String get docKey => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;
  int get isMoreCount => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentModelCopyWith<CommentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentModelCopyWith<$Res> {
  factory $CommentModelCopyWith(
          CommentModel value, $Res Function(CommentModel) then) =
      _$CommentModelCopyWithImpl<$Res>;
  $Res call(
      {String userKey,
      String docKey,
      String comment,
      int isMoreCount,
      @TimestampConverter() DateTime createdAt,
      @TimestampConverter() DateTime updatedAt});
}

/// @nodoc
class _$CommentModelCopyWithImpl<$Res> implements $CommentModelCopyWith<$Res> {
  _$CommentModelCopyWithImpl(this._value, this._then);

  final CommentModel _value;
  // ignore: unused_field
  final $Res Function(CommentModel) _then;

  @override
  $Res call({
    Object? userKey = freezed,
    Object? docKey = freezed,
    Object? comment = freezed,
    Object? isMoreCount = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      userKey: userKey == freezed
          ? _value.userKey
          : userKey // ignore: cast_nullable_to_non_nullable
              as String,
      docKey: docKey == freezed
          ? _value.docKey
          : docKey // ignore: cast_nullable_to_non_nullable
              as String,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      isMoreCount: isMoreCount == freezed
          ? _value.isMoreCount
          : isMoreCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$CommentModelCopyWith<$Res>
    implements $CommentModelCopyWith<$Res> {
  factory _$CommentModelCopyWith(
          _CommentModel value, $Res Function(_CommentModel) then) =
      __$CommentModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String userKey,
      String docKey,
      String comment,
      int isMoreCount,
      @TimestampConverter() DateTime createdAt,
      @TimestampConverter() DateTime updatedAt});
}

/// @nodoc
class __$CommentModelCopyWithImpl<$Res> extends _$CommentModelCopyWithImpl<$Res>
    implements _$CommentModelCopyWith<$Res> {
  __$CommentModelCopyWithImpl(
      _CommentModel _value, $Res Function(_CommentModel) _then)
      : super(_value, (v) => _then(v as _CommentModel));

  @override
  _CommentModel get _value => super._value as _CommentModel;

  @override
  $Res call({
    Object? userKey = freezed,
    Object? docKey = freezed,
    Object? comment = freezed,
    Object? isMoreCount = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_CommentModel(
      userKey: userKey == freezed
          ? _value.userKey
          : userKey // ignore: cast_nullable_to_non_nullable
              as String,
      docKey: docKey == freezed
          ? _value.docKey
          : docKey // ignore: cast_nullable_to_non_nullable
              as String,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      isMoreCount: isMoreCount == freezed
          ? _value.isMoreCount
          : isMoreCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CommentModel extends _CommentModel {
  const _$_CommentModel(
      {required this.userKey,
      required this.docKey,
      required this.comment,
      required this.isMoreCount,
      @TimestampConverter() required this.createdAt,
      @TimestampConverter() required this.updatedAt})
      : super._();

  factory _$_CommentModel.fromJson(Map<String, dynamic> json) =>
      _$$_CommentModelFromJson(json);

  @override
  final String userKey;
  @override
  final String docKey;
  @override
  final String comment;
  @override
  final int isMoreCount;
  @override
  @TimestampConverter()
  final DateTime createdAt;
  @override
  @TimestampConverter()
  final DateTime updatedAt;

  @override
  String toString() {
    return 'CommentModel(userKey: $userKey, docKey: $docKey, comment: $comment, isMoreCount: $isMoreCount, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CommentModel &&
            const DeepCollectionEquality().equals(other.userKey, userKey) &&
            const DeepCollectionEquality().equals(other.docKey, docKey) &&
            const DeepCollectionEquality().equals(other.comment, comment) &&
            const DeepCollectionEquality()
                .equals(other.isMoreCount, isMoreCount) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userKey),
      const DeepCollectionEquality().hash(docKey),
      const DeepCollectionEquality().hash(comment),
      const DeepCollectionEquality().hash(isMoreCount),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt));

  @JsonKey(ignore: true)
  @override
  _$CommentModelCopyWith<_CommentModel> get copyWith =>
      __$CommentModelCopyWithImpl<_CommentModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CommentModelToJson(this);
  }
}

abstract class _CommentModel extends CommentModel {
  const factory _CommentModel(
      {required String userKey,
      required String docKey,
      required String comment,
      required int isMoreCount,
      @TimestampConverter() required DateTime createdAt,
      @TimestampConverter() required DateTime updatedAt}) = _$_CommentModel;
  const _CommentModel._() : super._();

  factory _CommentModel.fromJson(Map<String, dynamic> json) =
      _$_CommentModel.fromJson;

  @override
  String get userKey;
  @override
  String get docKey;
  @override
  String get comment;
  @override
  int get isMoreCount;
  @override
  @TimestampConverter()
  DateTime get createdAt;
  @override
  @TimestampConverter()
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$CommentModelCopyWith<_CommentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

MoreCommentModel _$MoreCommentModelFromJson(Map<String, dynamic> json) {
  return _MoreCommentModel.fromJson(json);
}

/// @nodoc
class _$MoreCommentModelTearOff {
  const _$MoreCommentModelTearOff();

  _MoreCommentModel call(
      {required String userKey,
      required String commentUserKey,
      required String docKey,
      required String commentDocKey,
      required String comment,
      required int isMoreCount,
      @TimestampConverter() required DateTime createdAt,
      @TimestampConverter() required DateTime updatedAt}) {
    return _MoreCommentModel(
      userKey: userKey,
      commentUserKey: commentUserKey,
      docKey: docKey,
      commentDocKey: commentDocKey,
      comment: comment,
      isMoreCount: isMoreCount,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  MoreCommentModel fromJson(Map<String, Object?> json) {
    return MoreCommentModel.fromJson(json);
  }
}

/// @nodoc
const $MoreCommentModel = _$MoreCommentModelTearOff();

/// @nodoc
mixin _$MoreCommentModel {
  String get userKey => throw _privateConstructorUsedError;
  String get commentUserKey => throw _privateConstructorUsedError;
  String get docKey => throw _privateConstructorUsedError;
  String get commentDocKey => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;
  int get isMoreCount => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MoreCommentModelCopyWith<MoreCommentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoreCommentModelCopyWith<$Res> {
  factory $MoreCommentModelCopyWith(
          MoreCommentModel value, $Res Function(MoreCommentModel) then) =
      _$MoreCommentModelCopyWithImpl<$Res>;
  $Res call(
      {String userKey,
      String commentUserKey,
      String docKey,
      String commentDocKey,
      String comment,
      int isMoreCount,
      @TimestampConverter() DateTime createdAt,
      @TimestampConverter() DateTime updatedAt});
}

/// @nodoc
class _$MoreCommentModelCopyWithImpl<$Res>
    implements $MoreCommentModelCopyWith<$Res> {
  _$MoreCommentModelCopyWithImpl(this._value, this._then);

  final MoreCommentModel _value;
  // ignore: unused_field
  final $Res Function(MoreCommentModel) _then;

  @override
  $Res call({
    Object? userKey = freezed,
    Object? commentUserKey = freezed,
    Object? docKey = freezed,
    Object? commentDocKey = freezed,
    Object? comment = freezed,
    Object? isMoreCount = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      userKey: userKey == freezed
          ? _value.userKey
          : userKey // ignore: cast_nullable_to_non_nullable
              as String,
      commentUserKey: commentUserKey == freezed
          ? _value.commentUserKey
          : commentUserKey // ignore: cast_nullable_to_non_nullable
              as String,
      docKey: docKey == freezed
          ? _value.docKey
          : docKey // ignore: cast_nullable_to_non_nullable
              as String,
      commentDocKey: commentDocKey == freezed
          ? _value.commentDocKey
          : commentDocKey // ignore: cast_nullable_to_non_nullable
              as String,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      isMoreCount: isMoreCount == freezed
          ? _value.isMoreCount
          : isMoreCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$MoreCommentModelCopyWith<$Res>
    implements $MoreCommentModelCopyWith<$Res> {
  factory _$MoreCommentModelCopyWith(
          _MoreCommentModel value, $Res Function(_MoreCommentModel) then) =
      __$MoreCommentModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String userKey,
      String commentUserKey,
      String docKey,
      String commentDocKey,
      String comment,
      int isMoreCount,
      @TimestampConverter() DateTime createdAt,
      @TimestampConverter() DateTime updatedAt});
}

/// @nodoc
class __$MoreCommentModelCopyWithImpl<$Res>
    extends _$MoreCommentModelCopyWithImpl<$Res>
    implements _$MoreCommentModelCopyWith<$Res> {
  __$MoreCommentModelCopyWithImpl(
      _MoreCommentModel _value, $Res Function(_MoreCommentModel) _then)
      : super(_value, (v) => _then(v as _MoreCommentModel));

  @override
  _MoreCommentModel get _value => super._value as _MoreCommentModel;

  @override
  $Res call({
    Object? userKey = freezed,
    Object? commentUserKey = freezed,
    Object? docKey = freezed,
    Object? commentDocKey = freezed,
    Object? comment = freezed,
    Object? isMoreCount = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_MoreCommentModel(
      userKey: userKey == freezed
          ? _value.userKey
          : userKey // ignore: cast_nullable_to_non_nullable
              as String,
      commentUserKey: commentUserKey == freezed
          ? _value.commentUserKey
          : commentUserKey // ignore: cast_nullable_to_non_nullable
              as String,
      docKey: docKey == freezed
          ? _value.docKey
          : docKey // ignore: cast_nullable_to_non_nullable
              as String,
      commentDocKey: commentDocKey == freezed
          ? _value.commentDocKey
          : commentDocKey // ignore: cast_nullable_to_non_nullable
              as String,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      isMoreCount: isMoreCount == freezed
          ? _value.isMoreCount
          : isMoreCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MoreCommentModel extends _MoreCommentModel {
  const _$_MoreCommentModel(
      {required this.userKey,
      required this.commentUserKey,
      required this.docKey,
      required this.commentDocKey,
      required this.comment,
      required this.isMoreCount,
      @TimestampConverter() required this.createdAt,
      @TimestampConverter() required this.updatedAt})
      : super._();

  factory _$_MoreCommentModel.fromJson(Map<String, dynamic> json) =>
      _$$_MoreCommentModelFromJson(json);

  @override
  final String userKey;
  @override
  final String commentUserKey;
  @override
  final String docKey;
  @override
  final String commentDocKey;
  @override
  final String comment;
  @override
  final int isMoreCount;
  @override
  @TimestampConverter()
  final DateTime createdAt;
  @override
  @TimestampConverter()
  final DateTime updatedAt;

  @override
  String toString() {
    return 'MoreCommentModel(userKey: $userKey, commentUserKey: $commentUserKey, docKey: $docKey, commentDocKey: $commentDocKey, comment: $comment, isMoreCount: $isMoreCount, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MoreCommentModel &&
            const DeepCollectionEquality().equals(other.userKey, userKey) &&
            const DeepCollectionEquality()
                .equals(other.commentUserKey, commentUserKey) &&
            const DeepCollectionEquality().equals(other.docKey, docKey) &&
            const DeepCollectionEquality()
                .equals(other.commentDocKey, commentDocKey) &&
            const DeepCollectionEquality().equals(other.comment, comment) &&
            const DeepCollectionEquality()
                .equals(other.isMoreCount, isMoreCount) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userKey),
      const DeepCollectionEquality().hash(commentUserKey),
      const DeepCollectionEquality().hash(docKey),
      const DeepCollectionEquality().hash(commentDocKey),
      const DeepCollectionEquality().hash(comment),
      const DeepCollectionEquality().hash(isMoreCount),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt));

  @JsonKey(ignore: true)
  @override
  _$MoreCommentModelCopyWith<_MoreCommentModel> get copyWith =>
      __$MoreCommentModelCopyWithImpl<_MoreCommentModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MoreCommentModelToJson(this);
  }
}

abstract class _MoreCommentModel extends MoreCommentModel {
  const factory _MoreCommentModel(
      {required String userKey,
      required String commentUserKey,
      required String docKey,
      required String commentDocKey,
      required String comment,
      required int isMoreCount,
      @TimestampConverter() required DateTime createdAt,
      @TimestampConverter() required DateTime updatedAt}) = _$_MoreCommentModel;
  const _MoreCommentModel._() : super._();

  factory _MoreCommentModel.fromJson(Map<String, dynamic> json) =
      _$_MoreCommentModel.fromJson;

  @override
  String get userKey;
  @override
  String get commentUserKey;
  @override
  String get docKey;
  @override
  String get commentDocKey;
  @override
  String get comment;
  @override
  int get isMoreCount;
  @override
  @TimestampConverter()
  DateTime get createdAt;
  @override
  @TimestampConverter()
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$MoreCommentModelCopyWith<_MoreCommentModel> get copyWith =>
      throw _privateConstructorUsedError;
}
