// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ActivityModel _$$_ActivityModelFromJson(Map<String, dynamic> json) =>
    _$_ActivityModel(
      userKey: json['userKey'] as String,
      contentsDocKey: (json['contentsDocKey'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      likesDocKey: (json['likesDocKey'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      bookmarksDocKey: (json['bookmarksDocKey'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      followerUserKey: (json['followerUserKey'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      followingUserKey: (json['followingUserKey'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      region:
          (json['region'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_ActivityModelToJson(_$_ActivityModel instance) =>
    <String, dynamic>{
      'userKey': instance.userKey,
      'contentsDocKey': instance.contentsDocKey,
      'likesDocKey': instance.likesDocKey,
      'bookmarksDocKey': instance.bookmarksDocKey,
      'followerUserKey': instance.followerUserKey,
      'followingUserKey': instance.followingUserKey,
      'region': instance.region,
    };
