// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'keyword_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_KeywordModel _$$_KeywordModelFromJson(Map<String, dynamic> json) =>
    _$_KeywordModel(
      srcKeyword: (json['srcKeyword'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      tagKeyword: (json['tagKeyword'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_KeywordModelToJson(_$_KeywordModel instance) =>
    <String, dynamic>{
      'srcKeyword': instance.srcKeyword,
      'tagKeyword': instance.tagKeyword,
    };
