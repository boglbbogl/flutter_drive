import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_drive/course/model/course_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recommendation_model.freezed.dart';
part 'recommendation_model.g.dart';

@freezed
class RouteCourseModel with _$RouteCourseModel {
  const factory RouteCourseModel({
    required List<CourseSpot> spot,
    required String title,
    required List<String> likeUserKey,
    required String docKey,
    required String imageUrl,
  }) = _RouteCourseModel;
  const RouteCourseModel._();
  factory RouteCourseModel.fromJson(Map<String, dynamic> json) =>
      _$RouteCourseModelFromJson(json);
  factory RouteCourseModel.fromFireStore(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    return RouteCourseModel.fromJson(doc.data()!);
  }

  Map<String, dynamic> toFireStore() {
    final map = <String, dynamic>{};
    map["spot"] = spot.map((e) => e.toFireStore()).toList();
    map["title"] = title;
    map["likeUserKey"] = likeUserKey;
    map["docKey"] = docKey;
    map["imageUrl"] = imageUrl;
    return map;
  }
}
