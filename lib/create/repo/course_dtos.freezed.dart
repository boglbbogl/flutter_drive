// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'course_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CourseDto _$CourseDtoFromJson(Map<String, dynamic> json) {
  return _CourseDto.fromJson(json);
}

/// @nodoc
class _$CourseDtoTearOff {
  const _$CourseDtoTearOff();

  _CourseDto call(
      {required String userKey,
      required String docKey,
      required String explanation,
      required String createAt,
      required String updateAt,
      required List<String> tagKeyword,
      required int likeCount,
      required List<String> likeUserId,
      required List<String> imageUrl}) {
    return _CourseDto(
      userKey: userKey,
      docKey: docKey,
      explanation: explanation,
      createAt: createAt,
      updateAt: updateAt,
      tagKeyword: tagKeyword,
      likeCount: likeCount,
      likeUserId: likeUserId,
      imageUrl: imageUrl,
    );
  }

  CourseDto fromJson(Map<String, Object?> json) {
    return CourseDto.fromJson(json);
  }
}

/// @nodoc
const $CourseDto = _$CourseDtoTearOff();

/// @nodoc
mixin _$CourseDto {
  String get userKey => throw _privateConstructorUsedError;
  String get docKey => throw _privateConstructorUsedError;
  String get explanation => throw _privateConstructorUsedError;
  String get createAt => throw _privateConstructorUsedError;
  String get updateAt => throw _privateConstructorUsedError;
  List<String> get tagKeyword => throw _privateConstructorUsedError;
  int get likeCount => throw _privateConstructorUsedError;
  List<String> get likeUserId => throw _privateConstructorUsedError;
  List<String> get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CourseDtoCopyWith<CourseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseDtoCopyWith<$Res> {
  factory $CourseDtoCopyWith(CourseDto value, $Res Function(CourseDto) then) =
      _$CourseDtoCopyWithImpl<$Res>;
  $Res call(
      {String userKey,
      String docKey,
      String explanation,
      String createAt,
      String updateAt,
      List<String> tagKeyword,
      int likeCount,
      List<String> likeUserId,
      List<String> imageUrl});
}

/// @nodoc
class _$CourseDtoCopyWithImpl<$Res> implements $CourseDtoCopyWith<$Res> {
  _$CourseDtoCopyWithImpl(this._value, this._then);

  final CourseDto _value;
  // ignore: unused_field
  final $Res Function(CourseDto) _then;

  @override
  $Res call({
    Object? userKey = freezed,
    Object? docKey = freezed,
    Object? explanation = freezed,
    Object? createAt = freezed,
    Object? updateAt = freezed,
    Object? tagKeyword = freezed,
    Object? likeCount = freezed,
    Object? likeUserId = freezed,
    Object? imageUrl = freezed,
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
      explanation: explanation == freezed
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String,
      createAt: createAt == freezed
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as String,
      updateAt: updateAt == freezed
          ? _value.updateAt
          : updateAt // ignore: cast_nullable_to_non_nullable
              as String,
      tagKeyword: tagKeyword == freezed
          ? _value.tagKeyword
          : tagKeyword // ignore: cast_nullable_to_non_nullable
              as List<String>,
      likeCount: likeCount == freezed
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int,
      likeUserId: likeUserId == freezed
          ? _value.likeUserId
          : likeUserId // ignore: cast_nullable_to_non_nullable
              as List<String>,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$CourseDtoCopyWith<$Res> implements $CourseDtoCopyWith<$Res> {
  factory _$CourseDtoCopyWith(
          _CourseDto value, $Res Function(_CourseDto) then) =
      __$CourseDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String userKey,
      String docKey,
      String explanation,
      String createAt,
      String updateAt,
      List<String> tagKeyword,
      int likeCount,
      List<String> likeUserId,
      List<String> imageUrl});
}

/// @nodoc
class __$CourseDtoCopyWithImpl<$Res> extends _$CourseDtoCopyWithImpl<$Res>
    implements _$CourseDtoCopyWith<$Res> {
  __$CourseDtoCopyWithImpl(_CourseDto _value, $Res Function(_CourseDto) _then)
      : super(_value, (v) => _then(v as _CourseDto));

  @override
  _CourseDto get _value => super._value as _CourseDto;

  @override
  $Res call({
    Object? userKey = freezed,
    Object? docKey = freezed,
    Object? explanation = freezed,
    Object? createAt = freezed,
    Object? updateAt = freezed,
    Object? tagKeyword = freezed,
    Object? likeCount = freezed,
    Object? likeUserId = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_CourseDto(
      userKey: userKey == freezed
          ? _value.userKey
          : userKey // ignore: cast_nullable_to_non_nullable
              as String,
      docKey: docKey == freezed
          ? _value.docKey
          : docKey // ignore: cast_nullable_to_non_nullable
              as String,
      explanation: explanation == freezed
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String,
      createAt: createAt == freezed
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as String,
      updateAt: updateAt == freezed
          ? _value.updateAt
          : updateAt // ignore: cast_nullable_to_non_nullable
              as String,
      tagKeyword: tagKeyword == freezed
          ? _value.tagKeyword
          : tagKeyword // ignore: cast_nullable_to_non_nullable
              as List<String>,
      likeCount: likeCount == freezed
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int,
      likeUserId: likeUserId == freezed
          ? _value.likeUserId
          : likeUserId // ignore: cast_nullable_to_non_nullable
              as List<String>,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CourseDto extends _CourseDto {
  const _$_CourseDto(
      {required this.userKey,
      required this.docKey,
      required this.explanation,
      required this.createAt,
      required this.updateAt,
      required this.tagKeyword,
      required this.likeCount,
      required this.likeUserId,
      required this.imageUrl})
      : super._();

  factory _$_CourseDto.fromJson(Map<String, dynamic> json) =>
      _$$_CourseDtoFromJson(json);

  @override
  final String userKey;
  @override
  final String docKey;
  @override
  final String explanation;
  @override
  final String createAt;
  @override
  final String updateAt;
  @override
  final List<String> tagKeyword;
  @override
  final int likeCount;
  @override
  final List<String> likeUserId;
  @override
  final List<String> imageUrl;

  @override
  String toString() {
    return 'CourseDto(userKey: $userKey, docKey: $docKey, explanation: $explanation, createAt: $createAt, updateAt: $updateAt, tagKeyword: $tagKeyword, likeCount: $likeCount, likeUserId: $likeUserId, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CourseDto &&
            const DeepCollectionEquality().equals(other.userKey, userKey) &&
            const DeepCollectionEquality().equals(other.docKey, docKey) &&
            const DeepCollectionEquality()
                .equals(other.explanation, explanation) &&
            const DeepCollectionEquality().equals(other.createAt, createAt) &&
            const DeepCollectionEquality().equals(other.updateAt, updateAt) &&
            const DeepCollectionEquality()
                .equals(other.tagKeyword, tagKeyword) &&
            const DeepCollectionEquality().equals(other.likeCount, likeCount) &&
            const DeepCollectionEquality()
                .equals(other.likeUserId, likeUserId) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userKey),
      const DeepCollectionEquality().hash(docKey),
      const DeepCollectionEquality().hash(explanation),
      const DeepCollectionEquality().hash(createAt),
      const DeepCollectionEquality().hash(updateAt),
      const DeepCollectionEquality().hash(tagKeyword),
      const DeepCollectionEquality().hash(likeCount),
      const DeepCollectionEquality().hash(likeUserId),
      const DeepCollectionEquality().hash(imageUrl));

  @JsonKey(ignore: true)
  @override
  _$CourseDtoCopyWith<_CourseDto> get copyWith =>
      __$CourseDtoCopyWithImpl<_CourseDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CourseDtoToJson(this);
  }
}

abstract class _CourseDto extends CourseDto {
  const factory _CourseDto(
      {required String userKey,
      required String docKey,
      required String explanation,
      required String createAt,
      required String updateAt,
      required List<String> tagKeyword,
      required int likeCount,
      required List<String> likeUserId,
      required List<String> imageUrl}) = _$_CourseDto;
  const _CourseDto._() : super._();

  factory _CourseDto.fromJson(Map<String, dynamic> json) =
      _$_CourseDto.fromJson;

  @override
  String get userKey;
  @override
  String get docKey;
  @override
  String get explanation;
  @override
  String get createAt;
  @override
  String get updateAt;
  @override
  List<String> get tagKeyword;
  @override
  int get likeCount;
  @override
  List<String> get likeUserId;
  @override
  List<String> get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$CourseDtoCopyWith<_CourseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

CourseSpotDto _$CourseSpotDtoFromJson(Map<String, dynamic> json) {
  return _CourseSpotDto.fromJson(json);
}

/// @nodoc
class _$CourseSpotDtoTearOff {
  const _$CourseSpotDtoTearOff();

  _CourseSpotDto call(
      {required String placeName,
      required String addressName,
      required String id,
      required String lat,
      required String lon}) {
    return _CourseSpotDto(
      placeName: placeName,
      addressName: addressName,
      id: id,
      lat: lat,
      lon: lon,
    );
  }

  CourseSpotDto fromJson(Map<String, Object?> json) {
    return CourseSpotDto.fromJson(json);
  }
}

/// @nodoc
const $CourseSpotDto = _$CourseSpotDtoTearOff();

/// @nodoc
mixin _$CourseSpotDto {
  String get placeName => throw _privateConstructorUsedError;
  String get addressName => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get lat => throw _privateConstructorUsedError;
  String get lon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CourseSpotDtoCopyWith<CourseSpotDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseSpotDtoCopyWith<$Res> {
  factory $CourseSpotDtoCopyWith(
          CourseSpotDto value, $Res Function(CourseSpotDto) then) =
      _$CourseSpotDtoCopyWithImpl<$Res>;
  $Res call(
      {String placeName,
      String addressName,
      String id,
      String lat,
      String lon});
}

/// @nodoc
class _$CourseSpotDtoCopyWithImpl<$Res>
    implements $CourseSpotDtoCopyWith<$Res> {
  _$CourseSpotDtoCopyWithImpl(this._value, this._then);

  final CourseSpotDto _value;
  // ignore: unused_field
  final $Res Function(CourseSpotDto) _then;

  @override
  $Res call({
    Object? placeName = freezed,
    Object? addressName = freezed,
    Object? id = freezed,
    Object? lat = freezed,
    Object? lon = freezed,
  }) {
    return _then(_value.copyWith(
      placeName: placeName == freezed
          ? _value.placeName
          : placeName // ignore: cast_nullable_to_non_nullable
              as String,
      addressName: addressName == freezed
          ? _value.addressName
          : addressName // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      lat: lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as String,
      lon: lon == freezed
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$CourseSpotDtoCopyWith<$Res>
    implements $CourseSpotDtoCopyWith<$Res> {
  factory _$CourseSpotDtoCopyWith(
          _CourseSpotDto value, $Res Function(_CourseSpotDto) then) =
      __$CourseSpotDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String placeName,
      String addressName,
      String id,
      String lat,
      String lon});
}

/// @nodoc
class __$CourseSpotDtoCopyWithImpl<$Res>
    extends _$CourseSpotDtoCopyWithImpl<$Res>
    implements _$CourseSpotDtoCopyWith<$Res> {
  __$CourseSpotDtoCopyWithImpl(
      _CourseSpotDto _value, $Res Function(_CourseSpotDto) _then)
      : super(_value, (v) => _then(v as _CourseSpotDto));

  @override
  _CourseSpotDto get _value => super._value as _CourseSpotDto;

  @override
  $Res call({
    Object? placeName = freezed,
    Object? addressName = freezed,
    Object? id = freezed,
    Object? lat = freezed,
    Object? lon = freezed,
  }) {
    return _then(_CourseSpotDto(
      placeName: placeName == freezed
          ? _value.placeName
          : placeName // ignore: cast_nullable_to_non_nullable
              as String,
      addressName: addressName == freezed
          ? _value.addressName
          : addressName // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      lat: lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as String,
      lon: lon == freezed
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CourseSpotDto extends _CourseSpotDto {
  const _$_CourseSpotDto(
      {required this.placeName,
      required this.addressName,
      required this.id,
      required this.lat,
      required this.lon})
      : super._();

  factory _$_CourseSpotDto.fromJson(Map<String, dynamic> json) =>
      _$$_CourseSpotDtoFromJson(json);

  @override
  final String placeName;
  @override
  final String addressName;
  @override
  final String id;
  @override
  final String lat;
  @override
  final String lon;

  @override
  String toString() {
    return 'CourseSpotDto(placeName: $placeName, addressName: $addressName, id: $id, lat: $lat, lon: $lon)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CourseSpotDto &&
            const DeepCollectionEquality().equals(other.placeName, placeName) &&
            const DeepCollectionEquality()
                .equals(other.addressName, addressName) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.lat, lat) &&
            const DeepCollectionEquality().equals(other.lon, lon));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(placeName),
      const DeepCollectionEquality().hash(addressName),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(lat),
      const DeepCollectionEquality().hash(lon));

  @JsonKey(ignore: true)
  @override
  _$CourseSpotDtoCopyWith<_CourseSpotDto> get copyWith =>
      __$CourseSpotDtoCopyWithImpl<_CourseSpotDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CourseSpotDtoToJson(this);
  }
}

abstract class _CourseSpotDto extends CourseSpotDto {
  const factory _CourseSpotDto(
      {required String placeName,
      required String addressName,
      required String id,
      required String lat,
      required String lon}) = _$_CourseSpotDto;
  const _CourseSpotDto._() : super._();

  factory _CourseSpotDto.fromJson(Map<String, dynamic> json) =
      _$_CourseSpotDto.fromJson;

  @override
  String get placeName;
  @override
  String get addressName;
  @override
  String get id;
  @override
  String get lat;
  @override
  String get lon;
  @override
  @JsonKey(ignore: true)
  _$CourseSpotDtoCopyWith<_CourseSpotDto> get copyWith =>
      throw _privateConstructorUsedError;
}
