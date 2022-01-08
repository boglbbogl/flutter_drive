// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CourseModel _$$_CourseModelFromJson(Map<String, dynamic> json) =>
    _$_CourseModel(
      userKey: json['userKey'] as String,
      docKey: json['docKey'] as String,
      explanation: json['explanation'] as String,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
      updatedAt:
          const TimestampConverter().fromJson(json['updatedAt'] as Timestamp),
      srcKeyword: (json['srcKeyword'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      tagKeyword: (json['tagKeyword'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      driveSeason: (json['driveSeason'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      driveTime:
          (json['driveTime'] as List<dynamic>).map((e) => e as String).toList(),
      likeUserKey: (json['likeUserKey'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      bookmarkUserKey: (json['bookmarkUserKey'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      commentCount: json['commentCount'] as int,
      imageUrl:
          (json['imageUrl'] as List<dynamic>).map((e) => e as String).toList(),
      spot: (json['spot'] as List<dynamic>)
          .map((e) => CourseSpot.fromJson(e as Map<String, dynamic>))
          .toList(),
      moreCommentDocKey: (json['moreCommentDocKey'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      isBlocked: json['isBlocked'] as bool,
      blockedUserKey: (json['blockedUserKey'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_CourseModelToJson(_$_CourseModel instance) =>
    <String, dynamic>{
      'userKey': instance.userKey,
      'docKey': instance.docKey,
      'explanation': instance.explanation,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
      'srcKeyword': instance.srcKeyword,
      'tagKeyword': instance.tagKeyword,
      'driveSeason': instance.driveSeason,
      'driveTime': instance.driveTime,
      'likeUserKey': instance.likeUserKey,
      'bookmarkUserKey': instance.bookmarkUserKey,
      'commentCount': instance.commentCount,
      'imageUrl': instance.imageUrl,
      'spot': instance.spot,
      'moreCommentDocKey': instance.moreCommentDocKey,
      'isBlocked': instance.isBlocked,
      'blockedUserKey': instance.blockedUserKey,
    };

_$_CourseSpot _$$_CourseSpotFromJson(Map<String, dynamic> json) =>
    _$_CourseSpot(
      placeName: json['placeName'] as String,
      addressName: json['addressName'] as String,
      id: json['id'] as String,
      lat: json['lat'] as String,
      lon: json['lon'] as String,
    );

Map<String, dynamic> _$$_CourseSpotToJson(_$_CourseSpot instance) =>
    <String, dynamic>{
      'placeName': instance.placeName,
      'addressName': instance.addressName,
      'id': instance.id,
      'lat': instance.lat,
      'lon': instance.lon,
    };
