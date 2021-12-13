// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseModel _$CourseModelFromJson(Map<String, dynamic> json) => CourseModel(
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      docKey: json['docKey'] as String,
      title: json['title'] as String,
      explanation: json['explanation'] as String,
      createAt: json['createAt'] as String,
      updateAt: json['updateAt'] as String,
      tagKeyword: (json['tagKeyword'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$CourseModelToJson(CourseModel instance) =>
    <String, dynamic>{
      'user': instance.user,
      'docKey': instance.docKey,
      'title': instance.title,
      'explanation': instance.explanation,
      'createAt': instance.createAt,
      'updateAt': instance.updateAt,
      'tagKeyword': instance.tagKeyword,
    };
