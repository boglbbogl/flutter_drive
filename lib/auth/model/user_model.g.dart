// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      userKey: json['userKey'] as String,
      nickName: json['nickName'] as String,
      email: json['email'] as String,
      socialProfileUrl: json['socialProfileUrl'] as String,
      localProfileUrl: json['localProfileUrl'] as String,
      isSocialImage: json['isSocialImage'] as bool,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      provider: json['provider'] as String,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'userKey': instance.userKey,
      'nickName': instance.nickName,
      'email': instance.email,
      'socialProfileUrl': instance.socialProfileUrl,
      'localProfileUrl': instance.localProfileUrl,
      'isSocialImage': instance.isSocialImage,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'provider': instance.provider,
    };
