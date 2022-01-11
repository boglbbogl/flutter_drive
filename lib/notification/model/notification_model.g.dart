// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserNotificationModel _$$_UserNotificationModelFromJson(
        Map<String, dynamic> json) =>
    _$_UserNotificationModel(
      isUserLike: json['isUserLike'] as bool,
      isFeedLike: json['isFeedLike'] as bool,
      isFeedBookmark: json['isFeedBookmark'] as bool,
      isComment: json['isComment'] as bool,
      isMoreComment: json['isMoreComment'] as bool,
    );

Map<String, dynamic> _$$_UserNotificationModelToJson(
        _$_UserNotificationModel instance) =>
    <String, dynamic>{
      'isUserLike': instance.isUserLike,
      'isFeedLike': instance.isFeedLike,
      'isFeedBookmark': instance.isFeedBookmark,
      'isComment': instance.isComment,
      'isMoreComment': instance.isMoreComment,
    };

_$_NotificationModel _$$_NotificationModelFromJson(Map<String, dynamic> json) =>
    _$_NotificationModel(
      userKey: json['userKey'] as String,
      notiUserKey: json['notiUserKey'] as String,
      noti: json['noti'] as int,
      comment: json['comment'] as String,
      notiDocKey: json['notiDocKey'] as String,
      isHide: json['isHide'] as bool,
      docKey: json['docKey'] as String,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
    );

Map<String, dynamic> _$$_NotificationModelToJson(
        _$_NotificationModel instance) =>
    <String, dynamic>{
      'userKey': instance.userKey,
      'notiUserKey': instance.notiUserKey,
      'noti': instance.noti,
      'comment': instance.comment,
      'notiDocKey': instance.notiDocKey,
      'isHide': instance.isHide,
      'docKey': instance.docKey,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };
