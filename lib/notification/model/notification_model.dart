import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_drive/_constant/timestamp_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

@freezed
class UserNotificationModel with _$UserNotificationModel {
  const factory UserNotificationModel({
    required bool isUserLike,
    required bool isFeedLike,
    required bool isFeedBookmark,
    required bool isComment,
    required bool isMoreComment,
  }) = _UserNotificationModel;
  const UserNotificationModel._();
  factory UserNotificationModel.fromJson(Map<String, dynamic> json) =>
      _$UserNotificationModelFromJson(json);
  factory UserNotificationModel.fromFireStore(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    return UserNotificationModel.fromJson(doc.data()!);
  }
  factory UserNotificationModel.empty() => const UserNotificationModel(
        isUserLike: true,
        isFeedLike: true,
        isFeedBookmark: true,
        isComment: true,
        isMoreComment: true,
      );
}

@freezed
class NotificationModel with _$NotificationModel {
  const factory NotificationModel({
    required String userKey,
    required String notiUserKey,
    required int noti,
    required String comment,
    required String notiDocKey,
    required bool isHide,
    required String docKey,
    @TimestampConverter() required DateTime createdAt,
  }) = _NotificationModel;
  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
  factory NotificationModel.fromFireStore(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    return NotificationModel.fromJson(doc.data()!);
  }
}
