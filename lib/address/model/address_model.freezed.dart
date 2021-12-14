// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'address_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) {
  return _AddressModel.fromJson(json);
}

/// @nodoc
class _$AddressModelTearOff {
  const _$AddressModelTearOff();

  _AddressModel call(
      {required AddressModelMetaData meta,
      required List<AddressModelDocument> documents}) {
    return _AddressModel(
      meta: meta,
      documents: documents,
    );
  }

  AddressModel fromJson(Map<String, Object?> json) {
    return AddressModel.fromJson(json);
  }
}

/// @nodoc
const $AddressModel = _$AddressModelTearOff();

/// @nodoc
mixin _$AddressModel {
  AddressModelMetaData get meta => throw _privateConstructorUsedError;
  List<AddressModelDocument> get documents =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddressModelCopyWith<AddressModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressModelCopyWith<$Res> {
  factory $AddressModelCopyWith(
          AddressModel value, $Res Function(AddressModel) then) =
      _$AddressModelCopyWithImpl<$Res>;
  $Res call({AddressModelMetaData meta, List<AddressModelDocument> documents});

  $AddressModelMetaDataCopyWith<$Res> get meta;
}

/// @nodoc
class _$AddressModelCopyWithImpl<$Res> implements $AddressModelCopyWith<$Res> {
  _$AddressModelCopyWithImpl(this._value, this._then);

  final AddressModel _value;
  // ignore: unused_field
  final $Res Function(AddressModel) _then;

  @override
  $Res call({
    Object? meta = freezed,
    Object? documents = freezed,
  }) {
    return _then(_value.copyWith(
      meta: meta == freezed
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as AddressModelMetaData,
      documents: documents == freezed
          ? _value.documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<AddressModelDocument>,
    ));
  }

  @override
  $AddressModelMetaDataCopyWith<$Res> get meta {
    return $AddressModelMetaDataCopyWith<$Res>(_value.meta, (value) {
      return _then(_value.copyWith(meta: value));
    });
  }
}

/// @nodoc
abstract class _$AddressModelCopyWith<$Res>
    implements $AddressModelCopyWith<$Res> {
  factory _$AddressModelCopyWith(
          _AddressModel value, $Res Function(_AddressModel) then) =
      __$AddressModelCopyWithImpl<$Res>;
  @override
  $Res call({AddressModelMetaData meta, List<AddressModelDocument> documents});

  @override
  $AddressModelMetaDataCopyWith<$Res> get meta;
}

/// @nodoc
class __$AddressModelCopyWithImpl<$Res> extends _$AddressModelCopyWithImpl<$Res>
    implements _$AddressModelCopyWith<$Res> {
  __$AddressModelCopyWithImpl(
      _AddressModel _value, $Res Function(_AddressModel) _then)
      : super(_value, (v) => _then(v as _AddressModel));

  @override
  _AddressModel get _value => super._value as _AddressModel;

  @override
  $Res call({
    Object? meta = freezed,
    Object? documents = freezed,
  }) {
    return _then(_AddressModel(
      meta: meta == freezed
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as AddressModelMetaData,
      documents: documents == freezed
          ? _value.documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<AddressModelDocument>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AddressModel implements _AddressModel {
  const _$_AddressModel({required this.meta, required this.documents});

  factory _$_AddressModel.fromJson(Map<String, dynamic> json) =>
      _$$_AddressModelFromJson(json);

  @override
  final AddressModelMetaData meta;
  @override
  final List<AddressModelDocument> documents;

  @override
  String toString() {
    return 'AddressModel(meta: $meta, documents: $documents)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AddressModel &&
            const DeepCollectionEquality().equals(other.meta, meta) &&
            const DeepCollectionEquality().equals(other.documents, documents));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(meta),
      const DeepCollectionEquality().hash(documents));

  @JsonKey(ignore: true)
  @override
  _$AddressModelCopyWith<_AddressModel> get copyWith =>
      __$AddressModelCopyWithImpl<_AddressModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AddressModelToJson(this);
  }
}

abstract class _AddressModel implements AddressModel {
  const factory _AddressModel(
      {required AddressModelMetaData meta,
      required List<AddressModelDocument> documents}) = _$_AddressModel;

  factory _AddressModel.fromJson(Map<String, dynamic> json) =
      _$_AddressModel.fromJson;

  @override
  AddressModelMetaData get meta;
  @override
  List<AddressModelDocument> get documents;
  @override
  @JsonKey(ignore: true)
  _$AddressModelCopyWith<_AddressModel> get copyWith =>
      throw _privateConstructorUsedError;
}

AddressModelDocument _$AddressModelDocumentFromJson(Map<String, dynamic> json) {
  return _AddressModelDocument.fromJson(json);
}

/// @nodoc
class _$AddressModelDocumentTearOff {
  const _$AddressModelDocumentTearOff();

  _AddressModelDocument call(
      {@JsonKey(name: 'place_name') required String placeName}) {
    return _AddressModelDocument(
      placeName: placeName,
    );
  }

  AddressModelDocument fromJson(Map<String, Object?> json) {
    return AddressModelDocument.fromJson(json);
  }
}

/// @nodoc
const $AddressModelDocument = _$AddressModelDocumentTearOff();

/// @nodoc
mixin _$AddressModelDocument {
  @JsonKey(name: 'place_name')
  String get placeName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddressModelDocumentCopyWith<AddressModelDocument> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressModelDocumentCopyWith<$Res> {
  factory $AddressModelDocumentCopyWith(AddressModelDocument value,
          $Res Function(AddressModelDocument) then) =
      _$AddressModelDocumentCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'place_name') String placeName});
}

/// @nodoc
class _$AddressModelDocumentCopyWithImpl<$Res>
    implements $AddressModelDocumentCopyWith<$Res> {
  _$AddressModelDocumentCopyWithImpl(this._value, this._then);

  final AddressModelDocument _value;
  // ignore: unused_field
  final $Res Function(AddressModelDocument) _then;

  @override
  $Res call({
    Object? placeName = freezed,
  }) {
    return _then(_value.copyWith(
      placeName: placeName == freezed
          ? _value.placeName
          : placeName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$AddressModelDocumentCopyWith<$Res>
    implements $AddressModelDocumentCopyWith<$Res> {
  factory _$AddressModelDocumentCopyWith(_AddressModelDocument value,
          $Res Function(_AddressModelDocument) then) =
      __$AddressModelDocumentCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'place_name') String placeName});
}

/// @nodoc
class __$AddressModelDocumentCopyWithImpl<$Res>
    extends _$AddressModelDocumentCopyWithImpl<$Res>
    implements _$AddressModelDocumentCopyWith<$Res> {
  __$AddressModelDocumentCopyWithImpl(
      _AddressModelDocument _value, $Res Function(_AddressModelDocument) _then)
      : super(_value, (v) => _then(v as _AddressModelDocument));

  @override
  _AddressModelDocument get _value => super._value as _AddressModelDocument;

  @override
  $Res call({
    Object? placeName = freezed,
  }) {
    return _then(_AddressModelDocument(
      placeName: placeName == freezed
          ? _value.placeName
          : placeName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AddressModelDocument implements _AddressModelDocument {
  const _$_AddressModelDocument(
      {@JsonKey(name: 'place_name') required this.placeName});

  factory _$_AddressModelDocument.fromJson(Map<String, dynamic> json) =>
      _$$_AddressModelDocumentFromJson(json);

  @override
  @JsonKey(name: 'place_name')
  final String placeName;

  @override
  String toString() {
    return 'AddressModelDocument(placeName: $placeName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AddressModelDocument &&
            const DeepCollectionEquality().equals(other.placeName, placeName));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(placeName));

  @JsonKey(ignore: true)
  @override
  _$AddressModelDocumentCopyWith<_AddressModelDocument> get copyWith =>
      __$AddressModelDocumentCopyWithImpl<_AddressModelDocument>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AddressModelDocumentToJson(this);
  }
}

abstract class _AddressModelDocument implements AddressModelDocument {
  const factory _AddressModelDocument(
          {@JsonKey(name: 'place_name') required String placeName}) =
      _$_AddressModelDocument;

  factory _AddressModelDocument.fromJson(Map<String, dynamic> json) =
      _$_AddressModelDocument.fromJson;

  @override
  @JsonKey(name: 'place_name')
  String get placeName;
  @override
  @JsonKey(ignore: true)
  _$AddressModelDocumentCopyWith<_AddressModelDocument> get copyWith =>
      throw _privateConstructorUsedError;
}

AddressModelMetaData _$AddressModelMetaDataFromJson(Map<String, dynamic> json) {
  return _AddressModelMetaData.fromJson(json);
}

/// @nodoc
class _$AddressModelMetaDataTearOff {
  const _$AddressModelMetaDataTearOff();

  _AddressModelMetaData call(
      {@JsonKey(name: 'pageable_count') required int pageableCount,
      @JsonKey(name: 'total_count') required int totalCount,
      @JsonKey(name: 'is_end') required bool isEnd}) {
    return _AddressModelMetaData(
      pageableCount: pageableCount,
      totalCount: totalCount,
      isEnd: isEnd,
    );
  }

  AddressModelMetaData fromJson(Map<String, Object?> json) {
    return AddressModelMetaData.fromJson(json);
  }
}

/// @nodoc
const $AddressModelMetaData = _$AddressModelMetaDataTearOff();

/// @nodoc
mixin _$AddressModelMetaData {
  @JsonKey(name: 'pageable_count')
  int get pageableCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_count')
  int get totalCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_end')
  bool get isEnd => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddressModelMetaDataCopyWith<AddressModelMetaData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressModelMetaDataCopyWith<$Res> {
  factory $AddressModelMetaDataCopyWith(AddressModelMetaData value,
          $Res Function(AddressModelMetaData) then) =
      _$AddressModelMetaDataCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'pageable_count') int pageableCount,
      @JsonKey(name: 'total_count') int totalCount,
      @JsonKey(name: 'is_end') bool isEnd});
}

/// @nodoc
class _$AddressModelMetaDataCopyWithImpl<$Res>
    implements $AddressModelMetaDataCopyWith<$Res> {
  _$AddressModelMetaDataCopyWithImpl(this._value, this._then);

  final AddressModelMetaData _value;
  // ignore: unused_field
  final $Res Function(AddressModelMetaData) _then;

  @override
  $Res call({
    Object? pageableCount = freezed,
    Object? totalCount = freezed,
    Object? isEnd = freezed,
  }) {
    return _then(_value.copyWith(
      pageableCount: pageableCount == freezed
          ? _value.pageableCount
          : pageableCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalCount: totalCount == freezed
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      isEnd: isEnd == freezed
          ? _value.isEnd
          : isEnd // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$AddressModelMetaDataCopyWith<$Res>
    implements $AddressModelMetaDataCopyWith<$Res> {
  factory _$AddressModelMetaDataCopyWith(_AddressModelMetaData value,
          $Res Function(_AddressModelMetaData) then) =
      __$AddressModelMetaDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'pageable_count') int pageableCount,
      @JsonKey(name: 'total_count') int totalCount,
      @JsonKey(name: 'is_end') bool isEnd});
}

/// @nodoc
class __$AddressModelMetaDataCopyWithImpl<$Res>
    extends _$AddressModelMetaDataCopyWithImpl<$Res>
    implements _$AddressModelMetaDataCopyWith<$Res> {
  __$AddressModelMetaDataCopyWithImpl(
      _AddressModelMetaData _value, $Res Function(_AddressModelMetaData) _then)
      : super(_value, (v) => _then(v as _AddressModelMetaData));

  @override
  _AddressModelMetaData get _value => super._value as _AddressModelMetaData;

  @override
  $Res call({
    Object? pageableCount = freezed,
    Object? totalCount = freezed,
    Object? isEnd = freezed,
  }) {
    return _then(_AddressModelMetaData(
      pageableCount: pageableCount == freezed
          ? _value.pageableCount
          : pageableCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalCount: totalCount == freezed
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      isEnd: isEnd == freezed
          ? _value.isEnd
          : isEnd // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AddressModelMetaData implements _AddressModelMetaData {
  const _$_AddressModelMetaData(
      {@JsonKey(name: 'pageable_count') required this.pageableCount,
      @JsonKey(name: 'total_count') required this.totalCount,
      @JsonKey(name: 'is_end') required this.isEnd});

  factory _$_AddressModelMetaData.fromJson(Map<String, dynamic> json) =>
      _$$_AddressModelMetaDataFromJson(json);

  @override
  @JsonKey(name: 'pageable_count')
  final int pageableCount;
  @override
  @JsonKey(name: 'total_count')
  final int totalCount;
  @override
  @JsonKey(name: 'is_end')
  final bool isEnd;

  @override
  String toString() {
    return 'AddressModelMetaData(pageableCount: $pageableCount, totalCount: $totalCount, isEnd: $isEnd)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AddressModelMetaData &&
            const DeepCollectionEquality()
                .equals(other.pageableCount, pageableCount) &&
            const DeepCollectionEquality()
                .equals(other.totalCount, totalCount) &&
            const DeepCollectionEquality().equals(other.isEnd, isEnd));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(pageableCount),
      const DeepCollectionEquality().hash(totalCount),
      const DeepCollectionEquality().hash(isEnd));

  @JsonKey(ignore: true)
  @override
  _$AddressModelMetaDataCopyWith<_AddressModelMetaData> get copyWith =>
      __$AddressModelMetaDataCopyWithImpl<_AddressModelMetaData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AddressModelMetaDataToJson(this);
  }
}

abstract class _AddressModelMetaData implements AddressModelMetaData {
  const factory _AddressModelMetaData(
      {@JsonKey(name: 'pageable_count') required int pageableCount,
      @JsonKey(name: 'total_count') required int totalCount,
      @JsonKey(name: 'is_end') required bool isEnd}) = _$_AddressModelMetaData;

  factory _AddressModelMetaData.fromJson(Map<String, dynamic> json) =
      _$_AddressModelMetaData.fromJson;

  @override
  @JsonKey(name: 'pageable_count')
  int get pageableCount;
  @override
  @JsonKey(name: 'total_count')
  int get totalCount;
  @override
  @JsonKey(name: 'is_end')
  bool get isEnd;
  @override
  @JsonKey(ignore: true)
  _$AddressModelMetaDataCopyWith<_AddressModelMetaData> get copyWith =>
      throw _privateConstructorUsedError;
}
