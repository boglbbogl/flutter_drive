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
      introduction: json['introduction'] as String,
      cars: (json['cars'] as List<dynamic>).map((e) => e as String).toList(),
      city: (json['city'] as List<dynamic>).map((e) => e as String).toList(),
      privacyBookmarks: json['privacyBookmarks'] as bool,
      privacyLikes: json['privacyLikes'] as bool,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
      updatedAt:
          const TimestampConverter().fromJson(json['updatedAt'] as Timestamp),
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
      'introduction': instance.introduction,
      'cars': instance.cars,
      'city': instance.city,
      'privacyBookmarks': instance.privacyBookmarks,
      'privacyLikes': instance.privacyLikes,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
      'provider': instance.provider,
    };
