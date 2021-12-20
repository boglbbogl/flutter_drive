import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_drive/profile/model/profile_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'course_model.freezed.dart';
part 'course_model.g.dart';

@freezed
class CourseModel with _$CourseModel {
  const factory CourseModel({
    required String userKey,
    required String docKey,
    required String explanation,
    required String createAt,
    required String updateAt,
    required List<String> tagKeyword,
    required int likeCount,
    required List<String> likeUserId,
    required List<String> imageUrl,
    required List<CourseSpot> spot,
    required ProfileModel user,
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
    map["createAt"] = createAt;
    map["updateAt"] = updateAt;
    map["tagKeyword"] = tagKeyword;
    map["likeCount"] = likeCount;
    map["likeUserId"] = likeUserId;
    map["imageUrl"] = imageUrl;
    map["spot"] = spot.map((e) => e.toFireStore()).toList();
    map["user"] = user.toFireStore();
    return map;
  }

  factory CourseModel.empty() => CourseModel(
      userKey: "",
      docKey: "",
      explanation: "",
      createAt: DateTime.now().toString(),
      updateAt: DateTime.now().toString(),
      tagKeyword: [],
      likeCount: 0,
      likeUserId: [],
      imageUrl: [],
      spot: [],
      user: const ProfileModel(
          socialProfileUrl: "",
          localProfileUrl: "",
          isSocialImage: false,
          nickName: ""));
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
