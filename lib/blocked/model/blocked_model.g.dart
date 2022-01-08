// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blocked_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ContentBlockedModel _$$_ContentBlockedModelFromJson(
        Map<String, dynamic> json) =>
    _$_ContentBlockedModel(
      userKey: json['userKey'] as String,
      email: json['email'] as String,
      blockedDocKey: json['blockedDocKey'] as String,
      docKey: json['docKey'] as String,
      cause: json['cause'] as String,
      category: json['category'] as String,
      isCheck: json['isCheck'] as bool,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
    );

Map<String, dynamic> _$$_ContentBlockedModelToJson(
        _$_ContentBlockedModel instance) =>
    <String, dynamic>{
      'userKey': instance.userKey,
      'email': instance.email,
      'blockedDocKey': instance.blockedDocKey,
      'docKey': instance.docKey,
      'cause': instance.cause,
      'category': instance.category,
      'isCheck': instance.isCheck,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };
