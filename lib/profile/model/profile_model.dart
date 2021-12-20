import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

@freezed
class ProfileModel with _$ProfileModel {
  const factory ProfileModel({
    required String socialProfileUrl,
    required String localProfileUrl,
    required bool isSocialImage,
    required String nickName,
  }) = _ProfileModel;
  const ProfileModel._();
  factory ProfileModel.fromFireStore(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    return ProfileModel.fromJson(doc.data()!);
  }
  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
  Map<String, dynamic> toFireStore() {
    final map = <String, dynamic>{};
    map["socialProfileUrl"] = socialProfileUrl;
    map["localProfileUrl"] = localProfileUrl;
    map["isSocialImage"] = isSocialImage;
    map["nickName"] = nickName;
    return map;
  }
}
