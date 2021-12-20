// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProfileModel _$$_ProfileModelFromJson(Map<String, dynamic> json) =>
    _$_ProfileModel(
      socialProfileUrl: json['socialProfileUrl'] as String,
      localProfileUrl: json['localProfileUrl'] as String,
      isSocialImage: json['isSocialImage'] as bool,
      nickName: json['nickName'] as String,
    );

Map<String, dynamic> _$$_ProfileModelToJson(_$_ProfileModel instance) =>
    <String, dynamic>{
      'socialProfileUrl': instance.socialProfileUrl,
      'localProfileUrl': instance.localProfileUrl,
      'isSocialImage': instance.isSocialImage,
      'nickName': instance.nickName,
    };
