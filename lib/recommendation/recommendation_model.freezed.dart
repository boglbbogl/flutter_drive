// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'recommendation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RouteCourseModel _$RouteCourseModelFromJson(Map<String, dynamic> json) {
  return _RouteCourseModel.fromJson(json);
}

/// @nodoc
class _$RouteCourseModelTearOff {
  const _$RouteCourseModelTearOff();

  _RouteCourseModel call(
      {required List<CourseSpot> spot,
      required String title,
      required List<String> likeUserKey,
      required String docKey,
      required String imageUrl}) {
    return _RouteCourseModel(
      spot: spot,
      title: title,
      likeUserKey: likeUserKey,
      docKey: docKey,
      imageUrl: imageUrl,
    );
  }

  RouteCourseModel fromJson(Map<String, Object?> json) {
    return RouteCourseModel.fromJson(json);
  }
}

/// @nodoc
const $RouteCourseModel = _$RouteCourseModelTearOff();

/// @nodoc
mixin _$RouteCourseModel {
  List<CourseSpot> get spot => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  List<String> get likeUserKey => throw _privateConstructorUsedError;
  String get docKey => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RouteCourseModelCopyWith<RouteCourseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteCourseModelCopyWith<$Res> {
  factory $RouteCourseModelCopyWith(
          RouteCourseModel value, $Res Function(RouteCourseModel) then) =
      _$RouteCourseModelCopyWithImpl<$Res>;
  $Res call(
      {List<CourseSpot> spot,
      String title,
      List<String> likeUserKey,
      String docKey,
      String imageUrl});
}

/// @nodoc
class _$RouteCourseModelCopyWithImpl<$Res>
    implements $RouteCourseModelCopyWith<$Res> {
  _$RouteCourseModelCopyWithImpl(this._value, this._then);

  final RouteCourseModel _value;
  // ignore: unused_field
  final $Res Function(RouteCourseModel) _then;

  @override
  $Res call({
    Object? spot = freezed,
    Object? title = freezed,
    Object? likeUserKey = freezed,
    Object? docKey = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      spot: spot == freezed
          ? _value.spot
          : spot // ignore: cast_nullable_to_non_nullable
              as List<CourseSpot>,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      likeUserKey: likeUserKey == freezed
          ? _value.likeUserKey
          : likeUserKey // ignore: cast_nullable_to_non_nullable
              as List<String>,
      docKey: docKey == freezed
          ? _value.docKey
          : docKey // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$RouteCourseModelCopyWith<$Res>
    implements $RouteCourseModelCopyWith<$Res> {
  factory _$RouteCourseModelCopyWith(
          _RouteCourseModel value, $Res Function(_RouteCourseModel) then) =
      __$RouteCourseModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<CourseSpot> spot,
      String title,
      List<String> likeUserKey,
      String docKey,
      String imageUrl});
}

/// @nodoc
class __$RouteCourseModelCopyWithImpl<$Res>
    extends _$RouteCourseModelCopyWithImpl<$Res>
    implements _$RouteCourseModelCopyWith<$Res> {
  __$RouteCourseModelCopyWithImpl(
      _RouteCourseModel _value, $Res Function(_RouteCourseModel) _then)
      : super(_value, (v) => _then(v as _RouteCourseModel));

  @override
  _RouteCourseModel get _value => super._value as _RouteCourseModel;

  @override
  $Res call({
    Object? spot = freezed,
    Object? title = freezed,
    Object? likeUserKey = freezed,
    Object? docKey = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_RouteCourseModel(
      spot: spot == freezed
          ? _value.spot
          : spot // ignore: cast_nullable_to_non_nullable
              as List<CourseSpot>,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      likeUserKey: likeUserKey == freezed
          ? _value.likeUserKey
          : likeUserKey // ignore: cast_nullable_to_non_nullable
              as List<String>,
      docKey: docKey == freezed
          ? _value.docKey
          : docKey // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RouteCourseModel extends _RouteCourseModel {
  const _$_RouteCourseModel(
      {required this.spot,
      required this.title,
      required this.likeUserKey,
      required this.docKey,
      required this.imageUrl})
      : super._();

  factory _$_RouteCourseModel.fromJson(Map<String, dynamic> json) =>
      _$$_RouteCourseModelFromJson(json);

  @override
  final List<CourseSpot> spot;
  @override
  final String title;
  @override
  final List<String> likeUserKey;
  @override
  final String docKey;
  @override
  final String imageUrl;

  @override
  String toString() {
    return 'RouteCourseModel(spot: $spot, title: $title, likeUserKey: $likeUserKey, docKey: $docKey, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RouteCourseModel &&
            const DeepCollectionEquality().equals(other.spot, spot) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.likeUserKey, likeUserKey) &&
            const DeepCollectionEquality().equals(other.docKey, docKey) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(spot),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(likeUserKey),
      const DeepCollectionEquality().hash(docKey),
      const DeepCollectionEquality().hash(imageUrl));

  @JsonKey(ignore: true)
  @override
  _$RouteCourseModelCopyWith<_RouteCourseModel> get copyWith =>
      __$RouteCourseModelCopyWithImpl<_RouteCourseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RouteCourseModelToJson(this);
  }
}

abstract class _RouteCourseModel extends RouteCourseModel {
  const factory _RouteCourseModel(
      {required List<CourseSpot> spot,
      required String title,
      required List<String> likeUserKey,
      required String docKey,
      required String imageUrl}) = _$_RouteCourseModel;
  const _RouteCourseModel._() : super._();

  factory _RouteCourseModel.fromJson(Map<String, dynamic> json) =
      _$_RouteCourseModel.fromJson;

  @override
  List<CourseSpot> get spot;
  @override
  String get title;
  @override
  List<String> get likeUserKey;
  @override
  String get docKey;
  @override
  String get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$RouteCourseModelCopyWith<_RouteCourseModel> get copyWith =>
      throw _privateConstructorUsedError;
}
