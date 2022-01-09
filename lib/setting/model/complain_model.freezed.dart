// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'complain_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ComplainModel _$ComplainModelFromJson(Map<String, dynamic> json) {
  return _ComplainModel.fromJson(json);
}

/// @nodoc
class _$ComplainModelTearOff {
  const _$ComplainModelTearOff();

  _ComplainModel call(
      {required String userKey,
      required String email,
      required String explanation,
      required String docKey,
      required String category,
      required String answer,
      required bool isAnswer,
      @TimestampConverter() required DateTime createAt}) {
    return _ComplainModel(
      userKey: userKey,
      email: email,
      explanation: explanation,
      docKey: docKey,
      category: category,
      answer: answer,
      isAnswer: isAnswer,
      createAt: createAt,
    );
  }

  ComplainModel fromJson(Map<String, Object?> json) {
    return ComplainModel.fromJson(json);
  }
}

/// @nodoc
const $ComplainModel = _$ComplainModelTearOff();

/// @nodoc
mixin _$ComplainModel {
  String get userKey => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get explanation => throw _privateConstructorUsedError;
  String get docKey => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get answer => throw _privateConstructorUsedError;
  bool get isAnswer => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get createAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ComplainModelCopyWith<ComplainModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComplainModelCopyWith<$Res> {
  factory $ComplainModelCopyWith(
          ComplainModel value, $Res Function(ComplainModel) then) =
      _$ComplainModelCopyWithImpl<$Res>;
  $Res call(
      {String userKey,
      String email,
      String explanation,
      String docKey,
      String category,
      String answer,
      bool isAnswer,
      @TimestampConverter() DateTime createAt});
}

/// @nodoc
class _$ComplainModelCopyWithImpl<$Res>
    implements $ComplainModelCopyWith<$Res> {
  _$ComplainModelCopyWithImpl(this._value, this._then);

  final ComplainModel _value;
  // ignore: unused_field
  final $Res Function(ComplainModel) _then;

  @override
  $Res call({
    Object? userKey = freezed,
    Object? email = freezed,
    Object? explanation = freezed,
    Object? docKey = freezed,
    Object? category = freezed,
    Object? answer = freezed,
    Object? isAnswer = freezed,
    Object? createAt = freezed,
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
      explanation: explanation == freezed
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String,
      docKey: docKey == freezed
          ? _value.docKey
          : docKey // ignore: cast_nullable_to_non_nullable
              as String,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      answer: answer == freezed
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      isAnswer: isAnswer == freezed
          ? _value.isAnswer
          : isAnswer // ignore: cast_nullable_to_non_nullable
              as bool,
      createAt: createAt == freezed
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$ComplainModelCopyWith<$Res>
    implements $ComplainModelCopyWith<$Res> {
  factory _$ComplainModelCopyWith(
          _ComplainModel value, $Res Function(_ComplainModel) then) =
      __$ComplainModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String userKey,
      String email,
      String explanation,
      String docKey,
      String category,
      String answer,
      bool isAnswer,
      @TimestampConverter() DateTime createAt});
}

/// @nodoc
class __$ComplainModelCopyWithImpl<$Res>
    extends _$ComplainModelCopyWithImpl<$Res>
    implements _$ComplainModelCopyWith<$Res> {
  __$ComplainModelCopyWithImpl(
      _ComplainModel _value, $Res Function(_ComplainModel) _then)
      : super(_value, (v) => _then(v as _ComplainModel));

  @override
  _ComplainModel get _value => super._value as _ComplainModel;

  @override
  $Res call({
    Object? userKey = freezed,
    Object? email = freezed,
    Object? explanation = freezed,
    Object? docKey = freezed,
    Object? category = freezed,
    Object? answer = freezed,
    Object? isAnswer = freezed,
    Object? createAt = freezed,
  }) {
    return _then(_ComplainModel(
      userKey: userKey == freezed
          ? _value.userKey
          : userKey // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      explanation: explanation == freezed
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String,
      docKey: docKey == freezed
          ? _value.docKey
          : docKey // ignore: cast_nullable_to_non_nullable
              as String,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      answer: answer == freezed
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      isAnswer: isAnswer == freezed
          ? _value.isAnswer
          : isAnswer // ignore: cast_nullable_to_non_nullable
              as bool,
      createAt: createAt == freezed
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ComplainModel extends _ComplainModel {
  const _$_ComplainModel(
      {required this.userKey,
      required this.email,
      required this.explanation,
      required this.docKey,
      required this.category,
      required this.answer,
      required this.isAnswer,
      @TimestampConverter() required this.createAt})
      : super._();

  factory _$_ComplainModel.fromJson(Map<String, dynamic> json) =>
      _$$_ComplainModelFromJson(json);

  @override
  final String userKey;
  @override
  final String email;
  @override
  final String explanation;
  @override
  final String docKey;
  @override
  final String category;
  @override
  final String answer;
  @override
  final bool isAnswer;
  @override
  @TimestampConverter()
  final DateTime createAt;

  @override
  String toString() {
    return 'ComplainModel(userKey: $userKey, email: $email, explanation: $explanation, docKey: $docKey, category: $category, answer: $answer, isAnswer: $isAnswer, createAt: $createAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ComplainModel &&
            const DeepCollectionEquality().equals(other.userKey, userKey) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality()
                .equals(other.explanation, explanation) &&
            const DeepCollectionEquality().equals(other.docKey, docKey) &&
            const DeepCollectionEquality().equals(other.category, category) &&
            const DeepCollectionEquality().equals(other.answer, answer) &&
            const DeepCollectionEquality().equals(other.isAnswer, isAnswer) &&
            const DeepCollectionEquality().equals(other.createAt, createAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userKey),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(explanation),
      const DeepCollectionEquality().hash(docKey),
      const DeepCollectionEquality().hash(category),
      const DeepCollectionEquality().hash(answer),
      const DeepCollectionEquality().hash(isAnswer),
      const DeepCollectionEquality().hash(createAt));

  @JsonKey(ignore: true)
  @override
  _$ComplainModelCopyWith<_ComplainModel> get copyWith =>
      __$ComplainModelCopyWithImpl<_ComplainModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ComplainModelToJson(this);
  }
}

abstract class _ComplainModel extends ComplainModel {
  const factory _ComplainModel(
      {required String userKey,
      required String email,
      required String explanation,
      required String docKey,
      required String category,
      required String answer,
      required bool isAnswer,
      @TimestampConverter() required DateTime createAt}) = _$_ComplainModel;
  const _ComplainModel._() : super._();

  factory _ComplainModel.fromJson(Map<String, dynamic> json) =
      _$_ComplainModel.fromJson;

  @override
  String get userKey;
  @override
  String get email;
  @override
  String get explanation;
  @override
  String get docKey;
  @override
  String get category;
  @override
  String get answer;
  @override
  bool get isAnswer;
  @override
  @TimestampConverter()
  DateTime get createAt;
  @override
  @JsonKey(ignore: true)
  _$ComplainModelCopyWith<_ComplainModel> get copyWith =>
      throw _privateConstructorUsedError;
}
