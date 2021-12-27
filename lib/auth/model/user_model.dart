import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_drive/_constant/timestamp_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String userKey,
    required String nickName,
    required String email,
    required String socialProfileUrl,
    required String localProfileUrl,
    required bool isSocialImage,
    @TimestampConverter() required DateTime createdAt,
    @TimestampConverter() required DateTime updatedAt,
    required String provider,
  }) = _UserModel;
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  const UserModel._();

  factory UserModel.fromFireStore(DocumentSnapshot<Map<String, dynamic>> doc) {
    return UserModel.fromJson(doc.data()!);
  }
}
