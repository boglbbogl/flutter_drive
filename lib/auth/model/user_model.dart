import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String userKey;
  final String nickName;
  final String email;
  final String profileUrl;
  final String createdAt;
  final String provider;

  UserModel({
    required this.userKey,
    required this.nickName,
    required this.email,
    required this.profileUrl,
    required this.createdAt,
    required this.provider,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
