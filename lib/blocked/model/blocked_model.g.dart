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
      explanation: json['explanation'] as String,
      cause: (json['cause'] as List<dynamic>).map((e) => e as String).toList(),
      category: json['category'] as String,
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
      'explanation': instance.explanation,
      'cause': instance.cause,
      'category': instance.category,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };
