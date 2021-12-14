// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AddressModel _$$_AddressModelFromJson(Map<String, dynamic> json) =>
    _$_AddressModel(
      meta: AddressModelMetaData.fromJson(json['meta'] as Map<String, dynamic>),
      documents: (json['documents'] as List<dynamic>)
          .map((e) => AddressModelDocument.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AddressModelToJson(_$_AddressModel instance) =>
    <String, dynamic>{
      'meta': instance.meta,
      'documents': instance.documents,
    };

_$_AddressModelDocument _$$_AddressModelDocumentFromJson(
        Map<String, dynamic> json) =>
    _$_AddressModelDocument(
      placeName: json['place_name'] as String,
    );

Map<String, dynamic> _$$_AddressModelDocumentToJson(
        _$_AddressModelDocument instance) =>
    <String, dynamic>{
      'place_name': instance.placeName,
    };

_$_AddressModelMetaData _$$_AddressModelMetaDataFromJson(
        Map<String, dynamic> json) =>
    _$_AddressModelMetaData(
      pageableCount: json['pageable_count'] as int,
      totalCount: json['total_count'] as int,
      isEnd: json['is_end'] as bool,
    );

Map<String, dynamic> _$$_AddressModelMetaDataToJson(
        _$_AddressModelMetaData instance) =>
    <String, dynamic>{
      'pageable_count': instance.pageableCount,
      'total_count': instance.totalCount,
      'is_end': instance.isEnd,
    };
