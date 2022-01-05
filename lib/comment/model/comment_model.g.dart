// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CommentModel _$$_CommentModelFromJson(Map<String, dynamic> json) =>
    _$_CommentModel(
      userKey: json['userKey'] as String,
      docKey: json['docKey'] as String,
      comment: json['comment'] as String,
      isMoreCount: json['isMoreCount'] as int,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
      updatedAt:
          const TimestampConverter().fromJson(json['updatedAt'] as Timestamp),
    );

Map<String, dynamic> _$$_CommentModelToJson(_$_CommentModel instance) =>
    <String, dynamic>{
      'userKey': instance.userKey,
      'docKey': instance.docKey,
      'comment': instance.comment,
      'isMoreCount': instance.isMoreCount,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
    };

_$_MoreCommentModel _$$_MoreCommentModelFromJson(Map<String, dynamic> json) =>
    _$_MoreCommentModel(
      userKey: json['userKey'] as String,
      commentUserKey: json['commentUserKey'] as String,
      docKey: json['docKey'] as String,
      commentDocKey: json['commentDocKey'] as String,
      comment: json['comment'] as String,
      isMoreCount: json['isMoreCount'] as int,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
      updatedAt:
          const TimestampConverter().fromJson(json['updatedAt'] as Timestamp),
    );

Map<String, dynamic> _$$_MoreCommentModelToJson(_$_MoreCommentModel instance) =>
    <String, dynamic>{
      'userKey': instance.userKey,
      'commentUserKey': instance.commentUserKey,
      'docKey': instance.docKey,
      'commentDocKey': instance.commentDocKey,
      'comment': instance.comment,
      'isMoreCount': instance.isMoreCount,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
    };
