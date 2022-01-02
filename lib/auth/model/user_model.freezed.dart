// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
class _$UserModelTearOff {
  const _$UserModelTearOff();

  _UserModel call(
      {required String userKey,
      required String nickName,
      required String email,
      required String socialProfileUrl,
      required String localProfileUrl,
      required bool isSocialImage,
      required String introduction,
      required List<String> cars,
      required bool privacyBookmarks,
      required bool privacyLikes,
      @TimestampConverter() required DateTime createdAt,
      @TimestampConverter() required DateTime updatedAt,
      required String provider}) {
    return _UserModel(
      userKey: userKey,
      nickName: nickName,
      email: email,
      socialProfileUrl: socialProfileUrl,
      localProfileUrl: localProfileUrl,
      isSocialImage: isSocialImage,
      introduction: introduction,
      cars: cars,
      privacyBookmarks: privacyBookmarks,
      privacyLikes: privacyLikes,
      createdAt: createdAt,
      updatedAt: updatedAt,
      provider: provider,
    );
  }

  UserModel fromJson(Map<String, Object?> json) {
    return UserModel.fromJson(json);
  }
}

/// @nodoc
const $UserModel = _$UserModelTearOff();

/// @nodoc
mixin _$UserModel {
  String get userKey => throw _privateConstructorUsedError;
  String get nickName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get socialProfileUrl => throw _privateConstructorUsedError;
  String get localProfileUrl => throw _privateConstructorUsedError;
  bool get isSocialImage => throw _privateConstructorUsedError;
  String get introduction => throw _privateConstructorUsedError;
  List<String> get cars => throw _privateConstructorUsedError;
  bool get privacyBookmarks => throw _privateConstructorUsedError;
  bool get privacyLikes => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String get provider => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res>;
  $Res call(
      {String userKey,
      String nickName,
      String email,
      String socialProfileUrl,
      String localProfileUrl,
      bool isSocialImage,
      String introduction,
      List<String> cars,
      bool privacyBookmarks,
      bool privacyLikes,
      @TimestampConverter() DateTime createdAt,
      @TimestampConverter() DateTime updatedAt,
      String provider});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res> implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  final UserModel _value;
  // ignore: unused_field
  final $Res Function(UserModel) _then;

  @override
  $Res call({
    Object? userKey = freezed,
    Object? nickName = freezed,
    Object? email = freezed,
    Object? socialProfileUrl = freezed,
    Object? localProfileUrl = freezed,
    Object? isSocialImage = freezed,
    Object? introduction = freezed,
    Object? cars = freezed,
    Object? privacyBookmarks = freezed,
    Object? privacyLikes = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? provider = freezed,
  }) {
    return _then(_value.copyWith(
      userKey: userKey == freezed
          ? _value.userKey
          : userKey // ignore: cast_nullable_to_non_nullable
              as String,
      nickName: nickName == freezed
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      socialProfileUrl: socialProfileUrl == freezed
          ? _value.socialProfileUrl
          : socialProfileUrl // ignore: cast_nullable_to_non_nullable
              as String,
      localProfileUrl: localProfileUrl == freezed
          ? _value.localProfileUrl
          : localProfileUrl // ignore: cast_nullable_to_non_nullable
              as String,
      isSocialImage: isSocialImage == freezed
          ? _value.isSocialImage
          : isSocialImage // ignore: cast_nullable_to_non_nullable
              as bool,
      introduction: introduction == freezed
          ? _value.introduction
          : introduction // ignore: cast_nullable_to_non_nullable
              as String,
      cars: cars == freezed
          ? _value.cars
          : cars // ignore: cast_nullable_to_non_nullable
              as List<String>,
      privacyBookmarks: privacyBookmarks == freezed
          ? _value.privacyBookmarks
          : privacyBookmarks // ignore: cast_nullable_to_non_nullable
              as bool,
      privacyLikes: privacyLikes == freezed
          ? _value.privacyLikes
          : privacyLikes // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      provider: provider == freezed
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(
          _UserModel value, $Res Function(_UserModel) then) =
      __$UserModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String userKey,
      String nickName,
      String email,
      String socialProfileUrl,
      String localProfileUrl,
      bool isSocialImage,
      String introduction,
      List<String> cars,
      bool privacyBookmarks,
      bool privacyLikes,
      @TimestampConverter() DateTime createdAt,
      @TimestampConverter() DateTime updatedAt,
      String provider});
}

/// @nodoc
class __$UserModelCopyWithImpl<$Res> extends _$UserModelCopyWithImpl<$Res>
    implements _$UserModelCopyWith<$Res> {
  __$UserModelCopyWithImpl(_UserModel _value, $Res Function(_UserModel) _then)
      : super(_value, (v) => _then(v as _UserModel));

  @override
  _UserModel get _value => super._value as _UserModel;

  @override
  $Res call({
    Object? userKey = freezed,
    Object? nickName = freezed,
    Object? email = freezed,
    Object? socialProfileUrl = freezed,
    Object? localProfileUrl = freezed,
    Object? isSocialImage = freezed,
    Object? introduction = freezed,
    Object? cars = freezed,
    Object? privacyBookmarks = freezed,
    Object? privacyLikes = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? provider = freezed,
  }) {
    return _then(_UserModel(
      userKey: userKey == freezed
          ? _value.userKey
          : userKey // ignore: cast_nullable_to_non_nullable
              as String,
      nickName: nickName == freezed
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      socialProfileUrl: socialProfileUrl == freezed
          ? _value.socialProfileUrl
          : socialProfileUrl // ignore: cast_nullable_to_non_nullable
              as String,
      localProfileUrl: localProfileUrl == freezed
          ? _value.localProfileUrl
          : localProfileUrl // ignore: cast_nullable_to_non_nullable
              as String,
      isSocialImage: isSocialImage == freezed
          ? _value.isSocialImage
          : isSocialImage // ignore: cast_nullable_to_non_nullable
              as bool,
      introduction: introduction == freezed
          ? _value.introduction
          : introduction // ignore: cast_nullable_to_non_nullable
              as String,
      cars: cars == freezed
          ? _value.cars
          : cars // ignore: cast_nullable_to_non_nullable
              as List<String>,
      privacyBookmarks: privacyBookmarks == freezed
          ? _value.privacyBookmarks
          : privacyBookmarks // ignore: cast_nullable_to_non_nullable
              as bool,
      privacyLikes: privacyLikes == freezed
          ? _value.privacyLikes
          : privacyLikes // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      provider: provider == freezed
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserModel extends _UserModel {
  const _$_UserModel(
      {required this.userKey,
      required this.nickName,
      required this.email,
      required this.socialProfileUrl,
      required this.localProfileUrl,
      required this.isSocialImage,
      required this.introduction,
      required this.cars,
      required this.privacyBookmarks,
      required this.privacyLikes,
      @TimestampConverter() required this.createdAt,
      @TimestampConverter() required this.updatedAt,
      required this.provider})
      : super._();

  factory _$_UserModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserModelFromJson(json);

  @override
  final String userKey;
  @override
  final String nickName;
  @override
  final String email;
  @override
  final String socialProfileUrl;
  @override
  final String localProfileUrl;
  @override
  final bool isSocialImage;
  @override
  final String introduction;
  @override
  final List<String> cars;
  @override
  final bool privacyBookmarks;
  @override
  final bool privacyLikes;
  @override
  @TimestampConverter()
  final DateTime createdAt;
  @override
  @TimestampConverter()
  final DateTime updatedAt;
  @override
  final String provider;

  @override
  String toString() {
    return 'UserModel(userKey: $userKey, nickName: $nickName, email: $email, socialProfileUrl: $socialProfileUrl, localProfileUrl: $localProfileUrl, isSocialImage: $isSocialImage, introduction: $introduction, cars: $cars, privacyBookmarks: $privacyBookmarks, privacyLikes: $privacyLikes, createdAt: $createdAt, updatedAt: $updatedAt, provider: $provider)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserModel &&
            const DeepCollectionEquality().equals(other.userKey, userKey) &&
            const DeepCollectionEquality().equals(other.nickName, nickName) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality()
                .equals(other.socialProfileUrl, socialProfileUrl) &&
            const DeepCollectionEquality()
                .equals(other.localProfileUrl, localProfileUrl) &&
            const DeepCollectionEquality()
                .equals(other.isSocialImage, isSocialImage) &&
            const DeepCollectionEquality()
                .equals(other.introduction, introduction) &&
            const DeepCollectionEquality().equals(other.cars, cars) &&
            const DeepCollectionEquality()
                .equals(other.privacyBookmarks, privacyBookmarks) &&
            const DeepCollectionEquality()
                .equals(other.privacyLikes, privacyLikes) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            const DeepCollectionEquality().equals(other.provider, provider));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userKey),
      const DeepCollectionEquality().hash(nickName),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(socialProfileUrl),
      const DeepCollectionEquality().hash(localProfileUrl),
      const DeepCollectionEquality().hash(isSocialImage),
      const DeepCollectionEquality().hash(introduction),
      const DeepCollectionEquality().hash(cars),
      const DeepCollectionEquality().hash(privacyBookmarks),
      const DeepCollectionEquality().hash(privacyLikes),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt),
      const DeepCollectionEquality().hash(provider));

  @JsonKey(ignore: true)
  @override
  _$UserModelCopyWith<_UserModel> get copyWith =>
      __$UserModelCopyWithImpl<_UserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserModelToJson(this);
  }
}

abstract class _UserModel extends UserModel {
  const factory _UserModel(
      {required String userKey,
      required String nickName,
      required String email,
      required String socialProfileUrl,
      required String localProfileUrl,
      required bool isSocialImage,
      required String introduction,
      required List<String> cars,
      required bool privacyBookmarks,
      required bool privacyLikes,
      @TimestampConverter() required DateTime createdAt,
      @TimestampConverter() required DateTime updatedAt,
      required String provider}) = _$_UserModel;
  const _UserModel._() : super._();

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$_UserModel.fromJson;

  @override
  String get userKey;
  @override
  String get nickName;
  @override
  String get email;
  @override
  String get socialProfileUrl;
  @override
  String get localProfileUrl;
  @override
  bool get isSocialImage;
  @override
  String get introduction;
  @override
  List<String> get cars;
  @override
  bool get privacyBookmarks;
  @override
  bool get privacyLikes;
  @override
  @TimestampConverter()
  DateTime get createdAt;
  @override
  @TimestampConverter()
  DateTime get updatedAt;
  @override
  String get provider;
  @override
  @JsonKey(ignore: true)
  _$UserModelCopyWith<_UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}
