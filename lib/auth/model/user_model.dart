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
    required String createdAt,
    required String updatedAt,
    required String provider,
  }) = _UserModel;
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
