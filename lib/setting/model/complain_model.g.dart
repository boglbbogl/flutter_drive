// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complain_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ComplainModel _$$_ComplainModelFromJson(Map<String, dynamic> json) =>
    _$_ComplainModel(
      userKey: json['userKey'] as String,
      email: json['email'] as String,
      explanation: json['explanation'] as String,
      docKey: json['docKey'] as String,
      category: json['category'] as String,
      answer: json['answer'] as String,
      isAnswer: json['isAnswer'] as bool,
      createAt:
          const TimestampConverter().fromJson(json['createAt'] as Timestamp),
    );

Map<String, dynamic> _$$_ComplainModelToJson(_$_ComplainModel instance) =>
    <String, dynamic>{
      'userKey': instance.userKey,
      'email': instance.email,
      'explanation': instance.explanation,
      'docKey': instance.docKey,
      'category': instance.category,
      'answer': instance.answer,
      'isAnswer': instance.isAnswer,
      'createAt': const TimestampConverter().toJson(instance.createAt),
    };
