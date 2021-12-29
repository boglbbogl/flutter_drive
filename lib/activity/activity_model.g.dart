// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ActivityModel _$$_ActivityModelFromJson(Map<String, dynamic> json) =>
    _$_ActivityModel(
      contentsDocKey: (json['contentsDocKey'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      likesDocKey: (json['likesDocKey'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      bookmarksDocKey: (json['bookmarksDocKey'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_ActivityModelToJson(_$_ActivityModel instance) =>
    <String, dynamic>{
      'contentsDocKey': instance.contentsDocKey,
      'likesDocKey': instance.likesDocKey,
      'bookmarksDocKey': instance.bookmarksDocKey,
    };
