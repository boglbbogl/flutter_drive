// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommendation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RouteCourseModel _$$_RouteCourseModelFromJson(Map<String, dynamic> json) =>
    _$_RouteCourseModel(
      spot: (json['spot'] as List<dynamic>)
          .map((e) => CourseSpot.fromJson(e as Map<String, dynamic>))
          .toList(),
      title: json['title'] as String,
      likeUserKey: (json['likeUserKey'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      docKey: json['docKey'] as String,
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$$_RouteCourseModelToJson(_$_RouteCourseModel instance) =>
    <String, dynamic>{
      'spot': instance.spot,
      'title': instance.title,
      'likeUserKey': instance.likeUserKey,
      'docKey': instance.docKey,
      'imageUrl': instance.imageUrl,
    };
