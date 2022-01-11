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
  factory RouteCourseModel.fromJson(Map<String, dynamic> json) =>
      _$RouteCourseModelFromJson(json);
}
