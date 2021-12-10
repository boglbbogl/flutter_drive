// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      userKey: json['userKey'] as String,
      nickName: json['nickName'] as String,
      email: json['email'] as String,
      profileUrl: json['profileUrl'] as String,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'userKey': instance.userKey,
      'nickName': instance.nickName,
      'email': instance.email,
      'profileUrl': instance.profileUrl,
      'createdAt': instance.createdAt,
    };
