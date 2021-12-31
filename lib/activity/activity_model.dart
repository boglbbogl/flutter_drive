import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity_model.freezed.dart';
part 'activity_model.g.dart';

@freezed
class ActivityModel with _$ActivityModel {
  const factory ActivityModel({
    required List<String> contentsDocKey,
    required List<String> likesDocKey,
    required List<String> bookmarksDocKey,
    required List<String> followerUserKey,
    required List<String> followingUserKey,
    required List<String> region,
  }) = _ActivityModel;
  const ActivityModel._();

  factory ActivityModel.fromJson(Map<String, dynamic> json) =>
      _$ActivityModelFromJson(json);
  factory ActivityModel.fromFireStore(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    return ActivityModel.fromJson(doc.data()!);
  }

  factory ActivityModel.empty() => const ActivityModel(
        contentsDocKey: [],
        likesDocKey: [],
        bookmarksDocKey: [],
        followerUserKey: [],
        followingUserKey: [],
        region: [],
      );
}
