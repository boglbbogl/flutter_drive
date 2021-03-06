import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_drive/_constant/timestamp_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'course_model.freezed.dart';
part 'course_model.g.dart';

@freezed
class CourseModel with _$CourseModel {
  const factory CourseModel({
    required String userKey,
    required String docKey,
    required String explanation,
    @TimestampConverter() required DateTime createdAt,
    @TimestampConverter() required DateTime updatedAt,
    required List<String> srcKeyword,
    required List<String> tagKeyword,
    required List<String> driveSeason,
    required List<String> driveTime,
    required List<String> likeUserKey,
    required List<String> bookmarkUserKey,
    required int commentCount,
    required List<String> imageUrl,
    required List<CourseSpot> spot,
    required List<String> moreCommentDocKey,
    required bool isBlocked,
    required List<String> blockedUserKey,
  }) = _CourseModel;

  const CourseModel._();
  factory CourseModel.fromFireStore(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    return CourseModel.fromJson(doc.data()!);
  }
  factory CourseModel.fromJson(Map<String, dynamic> json) =>
      _$CourseModelFromJson(json);

  Map<String, dynamic> toFireStore() {
    final map = <String, dynamic>{};
    map["userKey"] = userKey;
    map["docKey"] = docKey;
    map["explanation"] = explanation;
    map["createdAt"] = createdAt;
    map["updatedAt"] = updatedAt;
    map["srcKeyword"] = srcKeyword;
    map["tagKeyword"] = tagKeyword;
    map["driveSeason"] = driveSeason;
    map["driveTime"] = driveTime;
    map["likeUserKey"] = likeUserKey;
    map["bookmarkUserKey"] = bookmarkUserKey;
    map["commentCount"] = commentCount;
    map["imageUrl"] = imageUrl;
    map["spot"] = spot.map((e) => e.toFireStore()).toList();
    map["moreCommentDocKey"] = moreCommentDocKey;
    map["isBlocked"] = isBlocked;
    map["blockedUserKey"] = blockedUserKey;
    return map;
  }

  factory CourseModel.empty() => CourseModel(
        userKey: "",
        docKey: "",
        explanation: "",
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        srcKeyword: [],
        tagKeyword: [],
        driveSeason: [],
        driveTime: [],
        likeUserKey: [],
        bookmarkUserKey: [],
        commentCount: 0,
        imageUrl: [],
        spot: [],
        isBlocked: false,
        // userProfile: ProfileModel.empty(),
        moreCommentDocKey: [],
        blockedUserKey: [],
      );
}

@freezed
class CourseSpot with _$CourseSpot {
  const factory CourseSpot({
    required String placeName,
    required String addressName,
    required String id,
    required String lat,
    required String lon,
  }) = _CourseSpot;
  const CourseSpot._();
  factory CourseSpot.fromFireStore(DocumentSnapshot<Map<String, dynamic>> doc) {
    return CourseSpot.fromJson(doc.data()!);
  }
  factory CourseSpot.fromJson(Map<String, dynamic> json) =>
      _$CourseSpotFromJson(json);

  Map<String, dynamic> toFireStore() {
    final map = <String, dynamic>{};
    map["placeName"] = placeName;
    map["addressName"] = addressName;
    map["id"] = id;
    map["lat"] = lat;
    map["lon"] = lon;
    return map;
  }

  factory CourseSpot.empty() => const CourseSpot(
        placeName: "",
        addressName: "",
        id: "",
        lat: "",
        lon: "",
      );
}
