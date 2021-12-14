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
      required String title,
      required String explanation,
      required String createAt,
      required String updateAt,
      required List<String> tagKeyword,
      required int likeCount,
      required List<String> likeUserId}) {
    return _CourseModel(
      userKey: userKey,
      docKey: docKey,
      title: title,
      explanation: explanation,
      createAt: createAt,
      updateAt: updateAt,
      tagKeyword: tagKeyword,
      likeCount: likeCount,
      likeUserId: likeUserId,
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
  String get title => throw _privateConstructorUsedError;
  String get explanation => throw _privateConstructorUsedError;
  String get createAt => throw _privateConstructorUsedError;
  String get updateAt => throw _privateConstructorUsedError;
  List<String> get tagKeyword => throw _privateConstructorUsedError;
  int get likeCount => throw _privateConstructorUsedError;
  List<String> get likeUserId => throw _privateConstructorUsedError;

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
      String title,
      String explanation,
      String createAt,
      String updateAt,
      List<String> tagKeyword,
      int likeCount,
      List<String> likeUserId});
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
    Object? title = freezed,
    Object? explanation = freezed,
    Object? createAt = freezed,
    Object? updateAt = freezed,
    Object? tagKeyword = freezed,
    Object? likeCount = freezed,
    Object? likeUserId = freezed,
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
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
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
      String title,
      String explanation,
      String createAt,
      String updateAt,
      List<String> tagKeyword,
      int likeCount,
      List<String> likeUserId});
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
    Object? title = freezed,
    Object? explanation = freezed,
    Object? createAt = freezed,
    Object? updateAt = freezed,
    Object? tagKeyword = freezed,
    Object? likeCount = freezed,
    Object? likeUserId = freezed,
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
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CourseModel implements _CourseModel {
  const _$_CourseModel(
      {required this.userKey,
      required this.docKey,
      required this.title,
      required this.explanation,
      required this.createAt,
      required this.updateAt,
      required this.tagKeyword,
      required this.likeCount,
      required this.likeUserId});

  factory _$_CourseModel.fromJson(Map<String, dynamic> json) =>
      _$$_CourseModelFromJson(json);

  @override
  final String userKey;
  @override
  final String docKey;
  @override
  final String title;
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
  String toString() {
    return 'CourseModel(userKey: $userKey, docKey: $docKey, title: $title, explanation: $explanation, createAt: $createAt, updateAt: $updateAt, tagKeyword: $tagKeyword, likeCount: $likeCount, likeUserId: $likeUserId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CourseModel &&
            const DeepCollectionEquality().equals(other.userKey, userKey) &&
            const DeepCollectionEquality().equals(other.docKey, docKey) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.explanation, explanation) &&
            const DeepCollectionEquality().equals(other.createAt, createAt) &&
            const DeepCollectionEquality().equals(other.updateAt, updateAt) &&
            const DeepCollectionEquality()
                .equals(other.tagKeyword, tagKeyword) &&
            const DeepCollectionEquality().equals(other.likeCount, likeCount) &&
            const DeepCollectionEquality()
                .equals(other.likeUserId, likeUserId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userKey),
      const DeepCollectionEquality().hash(docKey),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(explanation),
      const DeepCollectionEquality().hash(createAt),
      const DeepCollectionEquality().hash(updateAt),
      const DeepCollectionEquality().hash(tagKeyword),
      const DeepCollectionEquality().hash(likeCount),
      const DeepCollectionEquality().hash(likeUserId));

  @JsonKey(ignore: true)
  @override
  _$CourseModelCopyWith<_CourseModel> get copyWith =>
      __$CourseModelCopyWithImpl<_CourseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CourseModelToJson(this);
  }
}

abstract class _CourseModel implements CourseModel {
  const factory _CourseModel(
      {required String userKey,
      required String docKey,
      required String title,
      required String explanation,
      required String createAt,
      required String updateAt,
      required List<String> tagKeyword,
      required int likeCount,
      required List<String> likeUserId}) = _$_CourseModel;

  factory _CourseModel.fromJson(Map<String, dynamic> json) =
      _$_CourseModel.fromJson;

  @override
  String get userKey;
  @override
  String get docKey;
  @override
  String get title;
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
  @JsonKey(ignore: true)
  _$CourseModelCopyWith<_CourseModel> get copyWith =>
      throw _privateConstructorUsedError;
}
