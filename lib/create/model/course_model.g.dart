// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CourseModel _$$_CourseModelFromJson(Map<String, dynamic> json) =>
    _$_CourseModel(
      userKey: json['userKey'] as String,
      docKey: json['docKey'] as String,
      title: json['title'] as String,
      explanation: json['explanation'] as String,
      createAt: json['createAt'] as String,
      updateAt: json['updateAt'] as String,
      tagKeyword: (json['tagKeyword'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      likeCount: json['likeCount'] as int,
      likeUserId: (json['likeUserId'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_CourseModelToJson(_$_CourseModel instance) =>
    <String, dynamic>{
      'userKey': instance.userKey,
      'docKey': instance.docKey,
      'title': instance.title,
      'explanation': instance.explanation,
      'createAt': instance.createAt,
      'updateAt': instance.updateAt,
      'tagKeyword': instance.tagKeyword,
      'likeCount': instance.likeCount,
      'likeUserId': instance.likeUserId,
    };
