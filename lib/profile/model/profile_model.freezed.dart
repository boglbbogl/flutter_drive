// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) {
  return _ProfileModel.fromJson(json);
}

/// @nodoc
class _$ProfileModelTearOff {
  const _$ProfileModelTearOff();

  _ProfileModel call(
      {required String socialProfileUrl,
      required String localProfileUrl,
      required bool isSocialImage,
      required String nickName}) {
    return _ProfileModel(
      socialProfileUrl: socialProfileUrl,
      localProfileUrl: localProfileUrl,
      isSocialImage: isSocialImage,
      nickName: nickName,
    );
  }

  ProfileModel fromJson(Map<String, Object?> json) {
    return ProfileModel.fromJson(json);
  }
}

/// @nodoc
const $ProfileModel = _$ProfileModelTearOff();

/// @nodoc
mixin _$ProfileModel {
  String get socialProfileUrl => throw _privateConstructorUsedError;
  String get localProfileUrl => throw _privateConstructorUsedError;
  bool get isSocialImage => throw _privateConstructorUsedError;
  String get nickName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileModelCopyWith<ProfileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileModelCopyWith<$Res> {
  factory $ProfileModelCopyWith(
          ProfileModel value, $Res Function(ProfileModel) then) =
      _$ProfileModelCopyWithImpl<$Res>;
  $Res call(
      {String socialProfileUrl,
      String localProfileUrl,
      bool isSocialImage,
      String nickName});
}

/// @nodoc
class _$ProfileModelCopyWithImpl<$Res> implements $ProfileModelCopyWith<$Res> {
  _$ProfileModelCopyWithImpl(this._value, this._then);

  final ProfileModel _value;
  // ignore: unused_field
  final $Res Function(ProfileModel) _then;

  @override
  $Res call({
    Object? socialProfileUrl = freezed,
    Object? localProfileUrl = freezed,
    Object? isSocialImage = freezed,
    Object? nickName = freezed,
  }) {
    return _then(_value.copyWith(
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
      nickName: nickName == freezed
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ProfileModelCopyWith<$Res>
    implements $ProfileModelCopyWith<$Res> {
  factory _$ProfileModelCopyWith(
          _ProfileModel value, $Res Function(_ProfileModel) then) =
      __$ProfileModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String socialProfileUrl,
      String localProfileUrl,
      bool isSocialImage,
      String nickName});
}

/// @nodoc
class __$ProfileModelCopyWithImpl<$Res> extends _$ProfileModelCopyWithImpl<$Res>
    implements _$ProfileModelCopyWith<$Res> {
  __$ProfileModelCopyWithImpl(
      _ProfileModel _value, $Res Function(_ProfileModel) _then)
      : super(_value, (v) => _then(v as _ProfileModel));

  @override
  _ProfileModel get _value => super._value as _ProfileModel;

  @override
  $Res call({
    Object? socialProfileUrl = freezed,
    Object? localProfileUrl = freezed,
    Object? isSocialImage = freezed,
    Object? nickName = freezed,
  }) {
    return _then(_ProfileModel(
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
      nickName: nickName == freezed
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProfileModel extends _ProfileModel {
  const _$_ProfileModel(
      {required this.socialProfileUrl,
      required this.localProfileUrl,
      required this.isSocialImage,
      required this.nickName})
      : super._();

  factory _$_ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$$_ProfileModelFromJson(json);

  @override
  final String socialProfileUrl;
  @override
  final String localProfileUrl;
  @override
  final bool isSocialImage;
  @override
  final String nickName;

  @override
  String toString() {
    return 'ProfileModel(socialProfileUrl: $socialProfileUrl, localProfileUrl: $localProfileUrl, isSocialImage: $isSocialImage, nickName: $nickName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProfileModel &&
            const DeepCollectionEquality()
                .equals(other.socialProfileUrl, socialProfileUrl) &&
            const DeepCollectionEquality()
                .equals(other.localProfileUrl, localProfileUrl) &&
            const DeepCollectionEquality()
                .equals(other.isSocialImage, isSocialImage) &&
            const DeepCollectionEquality().equals(other.nickName, nickName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(socialProfileUrl),
      const DeepCollectionEquality().hash(localProfileUrl),
      const DeepCollectionEquality().hash(isSocialImage),
      const DeepCollectionEquality().hash(nickName));

  @JsonKey(ignore: true)
  @override
  _$ProfileModelCopyWith<_ProfileModel> get copyWith =>
      __$ProfileModelCopyWithImpl<_ProfileModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProfileModelToJson(this);
  }
}

abstract class _ProfileModel extends ProfileModel {
  const factory _ProfileModel(
      {required String socialProfileUrl,
      required String localProfileUrl,
      required bool isSocialImage,
      required String nickName}) = _$_ProfileModel;
  const _ProfileModel._() : super._();

  factory _ProfileModel.fromJson(Map<String, dynamic> json) =
      _$_ProfileModel.fromJson;

  @override
  String get socialProfileUrl;
  @override
  String get localProfileUrl;
  @override
  bool get isSocialImage;
  @override
  String get nickName;
  @override
  @JsonKey(ignore: true)
  _$ProfileModelCopyWith<_ProfileModel> get copyWith =>
      throw _privateConstructorUsedError;
}
