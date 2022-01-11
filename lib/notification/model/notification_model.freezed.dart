// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'notification_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserNotificationModel _$UserNotificationModelFromJson(
    Map<String, dynamic> json) {
  return _UserNotificationModel.fromJson(json);
}

/// @nodoc
class _$UserNotificationModelTearOff {
  const _$UserNotificationModelTearOff();

  _UserNotificationModel call(
      {required bool isUserLike,
      required bool isFeedLike,
      required bool isFeedBookmark,
      required bool isComment,
      required bool isMoreComment}) {
    return _UserNotificationModel(
      isUserLike: isUserLike,
      isFeedLike: isFeedLike,
      isFeedBookmark: isFeedBookmark,
      isComment: isComment,
      isMoreComment: isMoreComment,
    );
  }

  UserNotificationModel fromJson(Map<String, Object?> json) {
    return UserNotificationModel.fromJson(json);
  }
}

/// @nodoc
const $UserNotificationModel = _$UserNotificationModelTearOff();

/// @nodoc
mixin _$UserNotificationModel {
  bool get isUserLike => throw _privateConstructorUsedError;
  bool get isFeedLike => throw _privateConstructorUsedError;
  bool get isFeedBookmark => throw _privateConstructorUsedError;
  bool get isComment => throw _privateConstructorUsedError;
  bool get isMoreComment => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserNotificationModelCopyWith<UserNotificationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserNotificationModelCopyWith<$Res> {
  factory $UserNotificationModelCopyWith(UserNotificationModel value,
          $Res Function(UserNotificationModel) then) =
      _$UserNotificationModelCopyWithImpl<$Res>;
  $Res call(
      {bool isUserLike,
      bool isFeedLike,
      bool isFeedBookmark,
      bool isComment,
      bool isMoreComment});
}

/// @nodoc
class _$UserNotificationModelCopyWithImpl<$Res>
    implements $UserNotificationModelCopyWith<$Res> {
  _$UserNotificationModelCopyWithImpl(this._value, this._then);

  final UserNotificationModel _value;
  // ignore: unused_field
  final $Res Function(UserNotificationModel) _then;

  @override
  $Res call({
    Object? isUserLike = freezed,
    Object? isFeedLike = freezed,
    Object? isFeedBookmark = freezed,
    Object? isComment = freezed,
    Object? isMoreComment = freezed,
  }) {
    return _then(_value.copyWith(
      isUserLike: isUserLike == freezed
          ? _value.isUserLike
          : isUserLike // ignore: cast_nullable_to_non_nullable
              as bool,
      isFeedLike: isFeedLike == freezed
          ? _value.isFeedLike
          : isFeedLike // ignore: cast_nullable_to_non_nullable
              as bool,
      isFeedBookmark: isFeedBookmark == freezed
          ? _value.isFeedBookmark
          : isFeedBookmark // ignore: cast_nullable_to_non_nullable
              as bool,
      isComment: isComment == freezed
          ? _value.isComment
          : isComment // ignore: cast_nullable_to_non_nullable
              as bool,
      isMoreComment: isMoreComment == freezed
          ? _value.isMoreComment
          : isMoreComment // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$UserNotificationModelCopyWith<$Res>
    implements $UserNotificationModelCopyWith<$Res> {
  factory _$UserNotificationModelCopyWith(_UserNotificationModel value,
          $Res Function(_UserNotificationModel) then) =
      __$UserNotificationModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isUserLike,
      bool isFeedLike,
      bool isFeedBookmark,
      bool isComment,
      bool isMoreComment});
}

/// @nodoc
class __$UserNotificationModelCopyWithImpl<$Res>
    extends _$UserNotificationModelCopyWithImpl<$Res>
    implements _$UserNotificationModelCopyWith<$Res> {
  __$UserNotificationModelCopyWithImpl(_UserNotificationModel _value,
      $Res Function(_UserNotificationModel) _then)
      : super(_value, (v) => _then(v as _UserNotificationModel));

  @override
  _UserNotificationModel get _value => super._value as _UserNotificationModel;

  @override
  $Res call({
    Object? isUserLike = freezed,
    Object? isFeedLike = freezed,
    Object? isFeedBookmark = freezed,
    Object? isComment = freezed,
    Object? isMoreComment = freezed,
  }) {
    return _then(_UserNotificationModel(
      isUserLike: isUserLike == freezed
          ? _value.isUserLike
          : isUserLike // ignore: cast_nullable_to_non_nullable
              as bool,
      isFeedLike: isFeedLike == freezed
          ? _value.isFeedLike
          : isFeedLike // ignore: cast_nullable_to_non_nullable
              as bool,
      isFeedBookmark: isFeedBookmark == freezed
          ? _value.isFeedBookmark
          : isFeedBookmark // ignore: cast_nullable_to_non_nullable
              as bool,
      isComment: isComment == freezed
          ? _value.isComment
          : isComment // ignore: cast_nullable_to_non_nullable
              as bool,
      isMoreComment: isMoreComment == freezed
          ? _value.isMoreComment
          : isMoreComment // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserNotificationModel extends _UserNotificationModel {
  const _$_UserNotificationModel(
      {required this.isUserLike,
      required this.isFeedLike,
      required this.isFeedBookmark,
      required this.isComment,
      required this.isMoreComment})
      : super._();

  factory _$_UserNotificationModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserNotificationModelFromJson(json);

  @override
  final bool isUserLike;
  @override
  final bool isFeedLike;
  @override
  final bool isFeedBookmark;
  @override
  final bool isComment;
  @override
  final bool isMoreComment;

  @override
  String toString() {
    return 'UserNotificationModel(isUserLike: $isUserLike, isFeedLike: $isFeedLike, isFeedBookmark: $isFeedBookmark, isComment: $isComment, isMoreComment: $isMoreComment)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserNotificationModel &&
            const DeepCollectionEquality()
                .equals(other.isUserLike, isUserLike) &&
            const DeepCollectionEquality()
                .equals(other.isFeedLike, isFeedLike) &&
            const DeepCollectionEquality()
                .equals(other.isFeedBookmark, isFeedBookmark) &&
            const DeepCollectionEquality().equals(other.isComment, isComment) &&
            const DeepCollectionEquality()
                .equals(other.isMoreComment, isMoreComment));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isUserLike),
      const DeepCollectionEquality().hash(isFeedLike),
      const DeepCollectionEquality().hash(isFeedBookmark),
      const DeepCollectionEquality().hash(isComment),
      const DeepCollectionEquality().hash(isMoreComment));

  @JsonKey(ignore: true)
  @override
  _$UserNotificationModelCopyWith<_UserNotificationModel> get copyWith =>
      __$UserNotificationModelCopyWithImpl<_UserNotificationModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserNotificationModelToJson(this);
  }
}

abstract class _UserNotificationModel extends UserNotificationModel {
  const factory _UserNotificationModel(
      {required bool isUserLike,
      required bool isFeedLike,
      required bool isFeedBookmark,
      required bool isComment,
      required bool isMoreComment}) = _$_UserNotificationModel;
  const _UserNotificationModel._() : super._();

  factory _UserNotificationModel.fromJson(Map<String, dynamic> json) =
      _$_UserNotificationModel.fromJson;

  @override
  bool get isUserLike;
  @override
  bool get isFeedLike;
  @override
  bool get isFeedBookmark;
  @override
  bool get isComment;
  @override
  bool get isMoreComment;
  @override
  @JsonKey(ignore: true)
  _$UserNotificationModelCopyWith<_UserNotificationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) {
  return _NotificationModel.fromJson(json);
}

/// @nodoc
class _$NotificationModelTearOff {
  const _$NotificationModelTearOff();

  _NotificationModel call(
      {required String userKey,
      required String notiUserKey,
      required int noti,
      required String comment,
      required String notiDocKey,
      required bool isHide,
      required String docKey,
      @TimestampConverter() required DateTime createdAt}) {
    return _NotificationModel(
      userKey: userKey,
      notiUserKey: notiUserKey,
      noti: noti,
      comment: comment,
      notiDocKey: notiDocKey,
      isHide: isHide,
      docKey: docKey,
      createdAt: createdAt,
    );
  }

  NotificationModel fromJson(Map<String, Object?> json) {
    return NotificationModel.fromJson(json);
  }
}

/// @nodoc
const $NotificationModel = _$NotificationModelTearOff();

/// @nodoc
mixin _$NotificationModel {
  String get userKey => throw _privateConstructorUsedError;
  String get notiUserKey => throw _privateConstructorUsedError;
  int get noti => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;
  String get notiDocKey => throw _privateConstructorUsedError;
  bool get isHide => throw _privateConstructorUsedError;
  String get docKey => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationModelCopyWith<NotificationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationModelCopyWith<$Res> {
  factory $NotificationModelCopyWith(
          NotificationModel value, $Res Function(NotificationModel) then) =
      _$NotificationModelCopyWithImpl<$Res>;
  $Res call(
      {String userKey,
      String notiUserKey,
      int noti,
      String comment,
      String notiDocKey,
      bool isHide,
      String docKey,
      @TimestampConverter() DateTime createdAt});
}

/// @nodoc
class _$NotificationModelCopyWithImpl<$Res>
    implements $NotificationModelCopyWith<$Res> {
  _$NotificationModelCopyWithImpl(this._value, this._then);

  final NotificationModel _value;
  // ignore: unused_field
  final $Res Function(NotificationModel) _then;

  @override
  $Res call({
    Object? userKey = freezed,
    Object? notiUserKey = freezed,
    Object? noti = freezed,
    Object? comment = freezed,
    Object? notiDocKey = freezed,
    Object? isHide = freezed,
    Object? docKey = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      userKey: userKey == freezed
          ? _value.userKey
          : userKey // ignore: cast_nullable_to_non_nullable
              as String,
      notiUserKey: notiUserKey == freezed
          ? _value.notiUserKey
          : notiUserKey // ignore: cast_nullable_to_non_nullable
              as String,
      noti: noti == freezed
          ? _value.noti
          : noti // ignore: cast_nullable_to_non_nullable
              as int,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      notiDocKey: notiDocKey == freezed
          ? _value.notiDocKey
          : notiDocKey // ignore: cast_nullable_to_non_nullable
              as String,
      isHide: isHide == freezed
          ? _value.isHide
          : isHide // ignore: cast_nullable_to_non_nullable
              as bool,
      docKey: docKey == freezed
          ? _value.docKey
          : docKey // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$NotificationModelCopyWith<$Res>
    implements $NotificationModelCopyWith<$Res> {
  factory _$NotificationModelCopyWith(
          _NotificationModel value, $Res Function(_NotificationModel) then) =
      __$NotificationModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String userKey,
      String notiUserKey,
      int noti,
      String comment,
      String notiDocKey,
      bool isHide,
      String docKey,
      @TimestampConverter() DateTime createdAt});
}

/// @nodoc
class __$NotificationModelCopyWithImpl<$Res>
    extends _$NotificationModelCopyWithImpl<$Res>
    implements _$NotificationModelCopyWith<$Res> {
  __$NotificationModelCopyWithImpl(
      _NotificationModel _value, $Res Function(_NotificationModel) _then)
      : super(_value, (v) => _then(v as _NotificationModel));

  @override
  _NotificationModel get _value => super._value as _NotificationModel;

  @override
  $Res call({
    Object? userKey = freezed,
    Object? notiUserKey = freezed,
    Object? noti = freezed,
    Object? comment = freezed,
    Object? notiDocKey = freezed,
    Object? isHide = freezed,
    Object? docKey = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_NotificationModel(
      userKey: userKey == freezed
          ? _value.userKey
          : userKey // ignore: cast_nullable_to_non_nullable
              as String,
      notiUserKey: notiUserKey == freezed
          ? _value.notiUserKey
          : notiUserKey // ignore: cast_nullable_to_non_nullable
              as String,
      noti: noti == freezed
          ? _value.noti
          : noti // ignore: cast_nullable_to_non_nullable
              as int,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      notiDocKey: notiDocKey == freezed
          ? _value.notiDocKey
          : notiDocKey // ignore: cast_nullable_to_non_nullable
              as String,
      isHide: isHide == freezed
          ? _value.isHide
          : isHide // ignore: cast_nullable_to_non_nullable
              as bool,
      docKey: docKey == freezed
          ? _value.docKey
          : docKey // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotificationModel implements _NotificationModel {
  const _$_NotificationModel(
      {required this.userKey,
      required this.notiUserKey,
      required this.noti,
      required this.comment,
      required this.notiDocKey,
      required this.isHide,
      required this.docKey,
      @TimestampConverter() required this.createdAt});

  factory _$_NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$$_NotificationModelFromJson(json);

  @override
  final String userKey;
  @override
  final String notiUserKey;
  @override
  final int noti;
  @override
  final String comment;
  @override
  final String notiDocKey;
  @override
  final bool isHide;
  @override
  final String docKey;
  @override
  @TimestampConverter()
  final DateTime createdAt;

  @override
  String toString() {
    return 'NotificationModel(userKey: $userKey, notiUserKey: $notiUserKey, noti: $noti, comment: $comment, notiDocKey: $notiDocKey, isHide: $isHide, docKey: $docKey, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NotificationModel &&
            const DeepCollectionEquality().equals(other.userKey, userKey) &&
            const DeepCollectionEquality()
                .equals(other.notiUserKey, notiUserKey) &&
            const DeepCollectionEquality().equals(other.noti, noti) &&
            const DeepCollectionEquality().equals(other.comment, comment) &&
            const DeepCollectionEquality()
                .equals(other.notiDocKey, notiDocKey) &&
            const DeepCollectionEquality().equals(other.isHide, isHide) &&
            const DeepCollectionEquality().equals(other.docKey, docKey) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userKey),
      const DeepCollectionEquality().hash(notiUserKey),
      const DeepCollectionEquality().hash(noti),
      const DeepCollectionEquality().hash(comment),
      const DeepCollectionEquality().hash(notiDocKey),
      const DeepCollectionEquality().hash(isHide),
      const DeepCollectionEquality().hash(docKey),
      const DeepCollectionEquality().hash(createdAt));

  @JsonKey(ignore: true)
  @override
  _$NotificationModelCopyWith<_NotificationModel> get copyWith =>
      __$NotificationModelCopyWithImpl<_NotificationModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotificationModelToJson(this);
  }
}

abstract class _NotificationModel implements NotificationModel {
  const factory _NotificationModel(
          {required String userKey,
          required String notiUserKey,
          required int noti,
          required String comment,
          required String notiDocKey,
          required bool isHide,
          required String docKey,
          @TimestampConverter() required DateTime createdAt}) =
      _$_NotificationModel;

  factory _NotificationModel.fromJson(Map<String, dynamic> json) =
      _$_NotificationModel.fromJson;

  @override
  String get userKey;
  @override
  String get notiUserKey;
  @override
  int get noti;
  @override
  String get comment;
  @override
  String get notiDocKey;
  @override
  bool get isHide;
  @override
  String get docKey;
  @override
  @TimestampConverter()
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$NotificationModelCopyWith<_NotificationModel> get copyWith =>
      throw _privateConstructorUsedError;
}
