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
      likesUserKey: (json['likesUserKey'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      likeMeUserKey: (json['likeMeUserKey'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      contentsBlockedDocKey: (json['contentsBlockedDocKey'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      usersBlockedUserKey: (json['usersBlockedUserKey'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_ActivityModelToJson(_$_ActivityModel instance) =>
    <String, dynamic>{
      'userKey': instance.userKey,
      'contentsDocKey': instance.contentsDocKey,
      'likesDocKey': instance.likesDocKey,
      'bookmarksDocKey': instance.bookmarksDocKey,
      'followerUserKey': instance.followerUserKey,
      'followingUserKey': instance.followingUserKey,
      'likesUserKey': instance.likesUserKey,
      'likeMeUserKey': instance.likeMeUserKey,
      'contentsBlockedDocKey': instance.contentsBlockedDocKey,
      'usersBlockedUserKey': instance.usersBlockedUserKey,
    };
