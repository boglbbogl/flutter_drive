// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CourseDto _$$_CourseDtoFromJson(Map<String, dynamic> json) => _$_CourseDto(
      userKey: json['userKey'] as String,
      docKey: json['docKey'] as String,
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

Map<String, dynamic> _$$_CourseDtoToJson(_$_CourseDto instance) =>
    <String, dynamic>{
      'userKey': instance.userKey,
      'docKey': instance.docKey,
      'explanation': instance.explanation,
      'createAt': instance.createAt,
      'updateAt': instance.updateAt,
      'tagKeyword': instance.tagKeyword,
      'likeCount': instance.likeCount,
      'likeUserId': instance.likeUserId,
    };

_$_CourseSpotDto _$$_CourseSpotDtoFromJson(Map<String, dynamic> json) =>
    _$_CourseSpotDto(
      placeName: json['placeName'] as String,
      addressName: json['addressName'] as String,
      id: json['id'] as String,
      lat: json['lat'] as String,
      lon: json['lon'] as String,
    );

Map<String, dynamic> _$$_CourseSpotDtoToJson(_$_CourseSpotDto instance) =>
    <String, dynamic>{
      'placeName': instance.placeName,
      'addressName': instance.addressName,
      'id': instance.id,
      'lat': instance.lat,
      'lon': instance.lon,
    };
