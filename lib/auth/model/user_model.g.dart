// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      userKey: json['userKey'] as String,
      nickName: json['nickName'] as String,
      email: json['email'] as String,
      profileUrl: json['profileUrl'] as String,
      createdAt: json['createdAt'] as String,
      provider: json['provider'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'userKey': instance.userKey,
      'nickName': instance.nickName,
      'email': instance.email,
      'profileUrl': instance.profileUrl,
      'createdAt': instance.createdAt,
      'provider': instance.provider,
      'updatedAt': instance.updatedAt,
    };
