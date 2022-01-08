import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity_model.freezed.dart';
part 'activity_model.g.dart';

@freezed
class ActivityModel with _$ActivityModel {
  const factory ActivityModel({
    required String userKey,
    required List<String> contentsDocKey,
    required List<String> likesDocKey,
    required List<String> bookmarksDocKey,
    required List<String> followerUserKey,
    required List<String> followingUserKey,
    required List<String> likesUserKey,
    required List<String> likeMeUserKey,
    required List<String> contentsBlockedDocKey,
    required List<String> usersBlockedUserKey,
  }) = _ActivityModel;
  const ActivityModel._();

  factory ActivityModel.fromJson(Map<String, dynamic> json) =>
      _$ActivityModelFromJson(json);
  factory ActivityModel.fromFireStore(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    return ActivityModel.fromJson(doc.data()!);
  }

  factory ActivityModel.empty() => const ActivityModel(
        userKey: "",
        contentsDocKey: [],
        likesDocKey: [],
        bookmarksDocKey: [],
        followerUserKey: [],
        followingUserKey: [],
        likeMeUserKey: [],
        likesUserKey: [],
        contentsBlockedDocKey: [],
        usersBlockedUserKey: [],
      );
}
