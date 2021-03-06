// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'course_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CourseModel _$CourseModelFromJson(Map<String, dynamic> json) {
  return _CourseModel.fromJson(json);
}

/// @nodoc
class _$CourseModelTearOff {
  const _$CourseModelTearOff();

  _CourseModel call(
      {required String userKey,
      required String docKey,
      required String explanation,
      @TimestampConverter() required DateTime createdAt,
      @TimestampConverter() required DateTime updatedAt,
      required List<String> srcKeyword,
      required List<String> tagKeyword,
      required List<String> driveSeason,
      required List<String> driveTime,
      required List<String> likeUserKey,
      required List<String> bookmarkUserKey,
      required int commentCount,
      required List<String> imageUrl,
      required List<CourseSpot> spot,
      required List<String> moreCommentDocKey,
      required bool isBlocked,
      required List<String> blockedUserKey}) {
    return _CourseModel(
      userKey: userKey,
      docKey: docKey,
      explanation: explanation,
      createdAt: createdAt,
      updatedAt: updatedAt,
      srcKeyword: srcKeyword,
      tagKeyword: tagKeyword,
      driveSeason: driveSeason,
      driveTime: driveTime,
      likeUserKey: likeUserKey,
      bookmarkUserKey: bookmarkUserKey,
      commentCount: commentCount,
      imageUrl: imageUrl,
      spot: spot,
      moreCommentDocKey: moreCommentDocKey,
      isBlocked: isBlocked,
      blockedUserKey: blockedUserKey,
    );
  }

  CourseModel fromJson(Map<String, Object?> json) {
    return CourseModel.fromJson(json);
  }
}

/// @nodoc
const $CourseModel = _$CourseModelTearOff();

/// @nodoc
mixin _$CourseModel {
  String get userKey => throw _privateConstructorUsedError;
  String get docKey => throw _privateConstructorUsedError;
  String get explanation => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get updatedAt => throw _privateConstructorUsedError;
  List<String> get srcKeyword => throw _privateConstructorUsedError;
  List<String> get tagKeyword => throw _privateConstructorUsedError;
  List<String> get driveSeason => throw _privateConstructorUsedError;
  List<String> get driveTime => throw _privateConstructorUsedError;
  List<String> get likeUserKey => throw _privateConstructorUsedError;
  List<String> get bookmarkUserKey => throw _privateConstructorUsedError;
  int get commentCount => throw _privateConstructorUsedError;
  List<String> get imageUrl => throw _privateConstructorUsedError;
  List<CourseSpot> get spot => throw _privateConstructorUsedError;
  List<String> get moreCommentDocKey => throw _privateConstructorUsedError;
  bool get isBlocked => throw _privateConstructorUsedError;
  List<String> get blockedUserKey => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CourseModelCopyWith<CourseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseModelCopyWith<$Res> {
  factory $CourseModelCopyWith(
          CourseModel value, $Res Function(CourseModel) then) =
      _$CourseModelCopyWithImpl<$Res>;
  $Res call(
      {String userKey,
      String docKey,
      String explanation,
      @TimestampConverter() DateTime createdAt,
      @TimestampConverter() DateTime updatedAt,
      List<String> srcKeyword,
      List<String> tagKeyword,
      List<String> driveSeason,
      List<String> driveTime,
      List<String> likeUserKey,
      List<String> bookmarkUserKey,
      int commentCount,
      List<String> imageUrl,
      List<CourseSpot> spot,
      List<String> moreCommentDocKey,
      bool isBlocked,
      List<String> blockedUserKey});
}

/// @nodoc
class _$CourseModelCopyWithImpl<$Res> implements $CourseModelCopyWith<$Res> {
  _$CourseModelCopyWithImpl(this._value, this._then);

  final CourseModel _value;
  // ignore: unused_field
  final $Res Function(CourseModel) _then;

  @override
  $Res call({
    Object? userKey = freezed,
    Object? docKey = freezed,
    Object? explanation = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? srcKeyword = freezed,
    Object? tagKeyword = freezed,
    Object? driveSeason = freezed,
    Object? driveTime = freezed,
    Object? likeUserKey = freezed,
    Object? bookmarkUserKey = freezed,
    Object? commentCount = freezed,
    Object? imageUrl = freezed,
    Object? spot = freezed,
    Object? moreCommentDocKey = freezed,
    Object? isBlocked = freezed,
    Object? blockedUserKey = freezed,
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
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      srcKeyword: srcKeyword == freezed
          ? _value.srcKeyword
          : srcKeyword // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tagKeyword: tagKeyword == freezed
          ? _value.tagKeyword
          : tagKeyword // ignore: cast_nullable_to_non_nullable
              as List<String>,
      driveSeason: driveSeason == freezed
          ? _value.driveSeason
          : driveSeason // ignore: cast_nullable_to_non_nullable
              as List<String>,
      driveTime: driveTime == freezed
          ? _value.driveTime
          : driveTime // ignore: cast_nullable_to_non_nullable
              as List<String>,
      likeUserKey: likeUserKey == freezed
          ? _value.likeUserKey
          : likeUserKey // ignore: cast_nullable_to_non_nullable
              as List<String>,
      bookmarkUserKey: bookmarkUserKey == freezed
          ? _value.bookmarkUserKey
          : bookmarkUserKey // ignore: cast_nullable_to_non_nullable
              as List<String>,
      commentCount: commentCount == freezed
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as List<String>,
      spot: spot == freezed
          ? _value.spot
          : spot // ignore: cast_nullable_to_non_nullable
              as List<CourseSpot>,
      moreCommentDocKey: moreCommentDocKey == freezed
          ? _value.moreCommentDocKey
          : moreCommentDocKey // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isBlocked: isBlocked == freezed
          ? _value.isBlocked
          : isBlocked // ignore: cast_nullable_to_non_nullable
              as bool,
      blockedUserKey: blockedUserKey == freezed
          ? _value.blockedUserKey
          : blockedUserKey // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$CourseModelCopyWith<$Res>
    implements $CourseModelCopyWith<$Res> {
  factory _$CourseModelCopyWith(
          _CourseModel value, $Res Function(_CourseModel) then) =
      __$CourseModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String userKey,
      String docKey,
      String explanation,
      @TimestampConverter() DateTime createdAt,
      @TimestampConverter() DateTime updatedAt,
      List<String> srcKeyword,
      List<String> tagKeyword,
      List<String> driveSeason,
      List<String> driveTime,
      List<String> likeUserKey,
      List<String> bookmarkUserKey,
      int commentCount,
      List<String> imageUrl,
      List<CourseSpot> spot,
      List<String> moreCommentDocKey,
      bool isBlocked,
      List<String> blockedUserKey});
}

/// @nodoc
class __$CourseModelCopyWithImpl<$Res> extends _$CourseModelCopyWithImpl<$Res>
    implements _$CourseModelCopyWith<$Res> {
  __$CourseModelCopyWithImpl(
      _CourseModel _value, $Res Function(_CourseModel) _then)
      : super(_value, (v) => _then(v as _CourseModel));

  @override
  _CourseModel get _value => super._value as _CourseModel;

  @override
  $Res call({
    Object? userKey = freezed,
    Object? docKey = freezed,
    Object? explanation = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? srcKeyword = freezed,
    Object? tagKeyword = freezed,
    Object? driveSeason = freezed,
    Object? driveTime = freezed,
    Object? likeUserKey = freezed,
    Object? bookmarkUserKey = freezed,
    Object? commentCount = freezed,
    Object? imageUrl = freezed,
    Object? spot = freezed,
    Object? moreCommentDocKey = freezed,
    Object? isBlocked = freezed,
    Object? blockedUserKey = freezed,
  }) {
    return _then(_CourseModel(
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
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      srcKeyword: srcKeyword == freezed
          ? _value.srcKeyword
          : srcKeyword // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tagKeyword: tagKeyword == freezed
          ? _value.tagKeyword
          : tagKeyword // ignore: cast_nullable_to_non_nullable
              as List<String>,
      driveSeason: driveSeason == freezed
          ? _value.driveSeason
          : driveSeason // ignore: cast_nullable_to_non_nullable
              as List<String>,
      driveTime: driveTime == freezed
          ? _value.driveTime
          : driveTime // ignore: cast_nullable_to_non_nullable
              as List<String>,
      likeUserKey: likeUserKey == freezed
          ? _value.likeUserKey
          : likeUserKey // ignore: cast_nullable_to_non_nullable
              as List<String>,
      bookmarkUserKey: bookmarkUserKey == freezed
          ? _value.bookmarkUserKey
          : bookmarkUserKey // ignore: cast_nullable_to_non_nullable
              as List<String>,
      commentCount: commentCount == freezed
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as List<String>,
      spot: spot == freezed
          ? _value.spot
          : spot // ignore: cast_nullable_to_non_nullable
              as List<CourseSpot>,
      moreCommentDocKey: moreCommentDocKey == freezed
          ? _value.moreCommentDocKey
          : moreCommentDocKey // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isBlocked: isBlocked == freezed
          ? _value.isBlocked
          : isBlocked // ignore: cast_nullable_to_non_nullable
              as bool,
      blockedUserKey: blockedUserKey == freezed
          ? _value.blockedUserKey
          : blockedUserKey // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CourseModel extends _CourseModel {
  const _$_CourseModel(
      {required this.userKey,
      required this.docKey,
      required this.explanation,
      @TimestampConverter() required this.createdAt,
      @TimestampConverter() required this.updatedAt,
      required this.srcKeyword,
      required this.tagKeyword,
      required this.driveSeason,
      required this.driveTime,
      required this.likeUserKey,
      required this.bookmarkUserKey,
      required this.commentCount,
      required this.imageUrl,
      required this.spot,
      required this.moreCommentDocKey,
      required this.isBlocked,
      required this.blockedUserKey})
      : super._();

  factory _$_CourseModel.fromJson(Map<String, dynamic> json) =>
      _$$_CourseModelFromJson(json);

  @override
  final String userKey;
  @override
  final String docKey;
  @override
  final String explanation;
  @override
  @TimestampConverter()
  final DateTime createdAt;
  @override
  @TimestampConverter()
  final DateTime updatedAt;
  @override
  final List<String> srcKeyword;
  @override
  final List<String> tagKeyword;
  @override
  final List<String> driveSeason;
  @override
  final List<String> driveTime;
  @override
  final List<String> likeUserKey;
  @override
  final List<String> bookmarkUserKey;
  @override
  final int commentCount;
  @override
  final List<String> imageUrl;
  @override
  final List<CourseSpot> spot;
  @override
  final List<String> moreCommentDocKey;
  @override
  final bool isBlocked;
  @override
  final List<String> blockedUserKey;

  @override
  String toString() {
    return 'CourseModel(userKey: $userKey, docKey: $docKey, explanation: $explanation, createdAt: $createdAt, updatedAt: $updatedAt, srcKeyword: $srcKeyword, tagKeyword: $tagKeyword, driveSeason: $driveSeason, driveTime: $driveTime, likeUserKey: $likeUserKey, bookmarkUserKey: $bookmarkUserKey, commentCount: $commentCount, imageUrl: $imageUrl, spot: $spot, moreCommentDocKey: $moreCommentDocKey, isBlocked: $isBlocked, blockedUserKey: $blockedUserKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CourseModel &&
            const DeepCollectionEquality().equals(other.userKey, userKey) &&
            const DeepCollectionEquality().equals(other.docKey, docKey) &&
            const DeepCollectionEquality()
                .equals(other.explanation, explanation) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            const DeepCollectionEquality()
                .equals(other.srcKeyword, srcKeyword) &&
            const DeepCollectionEquality()
                .equals(other.tagKeyword, tagKeyword) &&
            const DeepCollectionEquality()
                .equals(other.driveSeason, driveSeason) &&
            const DeepCollectionEquality().equals(other.driveTime, driveTime) &&
            const DeepCollectionEquality()
                .equals(other.likeUserKey, likeUserKey) &&
            const DeepCollectionEquality()
                .equals(other.bookmarkUserKey, bookmarkUserKey) &&
            const DeepCollectionEquality()
                .equals(other.commentCount, commentCount) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl) &&
            const DeepCollectionEquality().equals(other.spot, spot) &&
            const DeepCollectionEquality()
                .equals(other.moreCommentDocKey, moreCommentDocKey) &&
            const DeepCollectionEquality().equals(other.isBlocked, isBlocked) &&
            const DeepCollectionEquality()
                .equals(other.blockedUserKey, blockedUserKey));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userKey),
      const DeepCollectionEquality().hash(docKey),
      const DeepCollectionEquality().hash(explanation),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt),
      const DeepCollectionEquality().hash(srcKeyword),
      const DeepCollectionEquality().hash(tagKeyword),
      const DeepCollectionEquality().hash(driveSeason),
      const DeepCollectionEquality().hash(driveTime),
      const DeepCollectionEquality().hash(likeUserKey),
      const DeepCollectionEquality().hash(bookmarkUserKey),
      const DeepCollectionEquality().hash(commentCount),
      const DeepCollectionEquality().hash(imageUrl),
      const DeepCollectionEquality().hash(spot),
      const DeepCollectionEquality().hash(moreCommentDocKey),
      const DeepCollectionEquality().hash(isBlocked),
      const DeepCollectionEquality().hash(blockedUserKey));

  @JsonKey(ignore: true)
  @override
  _$CourseModelCopyWith<_CourseModel> get copyWith =>
      __$CourseModelCopyWithImpl<_CourseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CourseModelToJson(this);
  }
}

abstract class _CourseModel extends CourseModel {
  const factory _CourseModel(
      {required String userKey,
      required String docKey,
      required String explanation,
      @TimestampConverter() required DateTime createdAt,
      @TimestampConverter() required DateTime updatedAt,
      required List<String> srcKeyword,
      required List<String> tagKeyword,
      required List<String> driveSeason,
      required List<String> driveTime,
      required List<String> likeUserKey,
      required List<String> bookmarkUserKey,
      required int commentCount,
      required List<String> imageUrl,
      required List<CourseSpot> spot,
      required List<String> moreCommentDocKey,
      required bool isBlocked,
      required List<String> blockedUserKey}) = _$_CourseModel;
  const _CourseModel._() : super._();

  factory _CourseModel.fromJson(Map<String, dynamic> json) =
      _$_CourseModel.fromJson;

  @override
  String get userKey;
  @override
  String get docKey;
  @override
  String get explanation;
  @override
  @TimestampConverter()
  DateTime get createdAt;
  @override
  @TimestampConverter()
  DateTime get updatedAt;
  @override
  List<String> get srcKeyword;
  @override
  List<String> get tagKeyword;
  @override
  List<String> get driveSeason;
  @override
  List<String> get driveTime;
  @override
  List<String> get likeUserKey;
  @override
  List<String> get bookmarkUserKey;
  @override
  int get commentCount;
  @override
  List<String> get imageUrl;
  @override
  List<CourseSpot> get spot;
  @override
  List<String> get moreCommentDocKey;
  @override
  bool get isBlocked;
  @override
  List<String> get blockedUserKey;
  @override
  @JsonKey(ignore: true)
  _$CourseModelCopyWith<_CourseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

CourseSpot _$CourseSpotFromJson(Map<String, dynamic> json) {
  return _CourseSpot.fromJson(json);
}

/// @nodoc
class _$CourseSpotTearOff {
  const _$CourseSpotTearOff();

  _CourseSpot call(
      {required String placeName,
      required String addressName,
      required String id,
      required String lat,
      required String lon}) {
    return _CourseSpot(
      placeName: placeName,
      addressName: addressName,
      id: id,
      lat: lat,
      lon: lon,
    );
  }

  CourseSpot fromJson(Map<String, Object?> json) {
    return CourseSpot.fromJson(json);
  }
}

/// @nodoc
const $CourseSpot = _$CourseSpotTearOff();

/// @nodoc
mixin _$CourseSpot {
  String get placeName => throw _privateConstructorUsedError;
  String get addressName => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get lat => throw _privateConstructorUsedError;
  String get lon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CourseSpotCopyWith<CourseSpot> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseSpotCopyWith<$Res> {
  factory $CourseSpotCopyWith(
          CourseSpot value, $Res Function(CourseSpot) then) =
      _$CourseSpotCopyWithImpl<$Res>;
  $Res call(
      {String placeName,
      String addressName,
      String id,
      String lat,
      String lon});
}

/// @nodoc
class _$CourseSpotCopyWithImpl<$Res> implements $CourseSpotCopyWith<$Res> {
  _$CourseSpotCopyWithImpl(this._value, this._then);

  final CourseSpot _value;
  // ignore: unused_field
  final $Res Function(CourseSpot) _then;

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
abstract class _$CourseSpotCopyWith<$Res> implements $CourseSpotCopyWith<$Res> {
  factory _$CourseSpotCopyWith(
          _CourseSpot value, $Res Function(_CourseSpot) then) =
      __$CourseSpotCopyWithImpl<$Res>;
  @override
  $Res call(
      {String placeName,
      String addressName,
      String id,
      String lat,
      String lon});
}

/// @nodoc
class __$CourseSpotCopyWithImpl<$Res> extends _$CourseSpotCopyWithImpl<$Res>
    implements _$CourseSpotCopyWith<$Res> {
  __$CourseSpotCopyWithImpl(
      _CourseSpot _value, $Res Function(_CourseSpot) _then)
      : super(_value, (v) => _then(v as _CourseSpot));

  @override
  _CourseSpot get _value => super._value as _CourseSpot;

  @override
  $Res call({
    Object? placeName = freezed,
    Object? addressName = freezed,
    Object? id = freezed,
    Object? lat = freezed,
    Object? lon = freezed,
  }) {
    return _then(_CourseSpot(
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
class _$_CourseSpot extends _CourseSpot {
  const _$_CourseSpot(
      {required this.placeName,
      required this.addressName,
      required this.id,
      required this.lat,
      required this.lon})
      : super._();

  factory _$_CourseSpot.fromJson(Map<String, dynamic> json) =>
      _$$_CourseSpotFromJson(json);

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
    return 'CourseSpot(placeName: $placeName, addressName: $addressName, id: $id, lat: $lat, lon: $lon)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CourseSpot &&
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
  _$CourseSpotCopyWith<_CourseSpot> get copyWith =>
      __$CourseSpotCopyWithImpl<_CourseSpot>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CourseSpotToJson(this);
  }
}

abstract class _CourseSpot extends CourseSpot {
  const factory _CourseSpot(
      {required String placeName,
      required String addressName,
      required String id,
      required String lat,
      required String lon}) = _$_CourseSpot;
  const _CourseSpot._() : super._();

  factory _CourseSpot.fromJson(Map<String, dynamic> json) =
      _$_CourseSpot.fromJson;

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
  _$CourseSpotCopyWith<_CourseSpot> get copyWith =>
      throw _privateConstructorUsedError;
}
