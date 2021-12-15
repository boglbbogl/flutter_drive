import 'package:freezed_annotation/freezed_annotation.dart';

part 'course_model.freezed.dart';
part 'course_model.g.dart';

@freezed
class CourseModel with _$CourseModel {
  const factory CourseModel({
    required String userKey,
    required String docKey,
    required String title,
    required String explanation,
    required String createAt,
    required String updateAt,
    required List<String> tagKeyword,
    required int likeCount,
    required List<String> likeUserId,
    required List<Map<String, dynamic>> spot,
  }) = _CourseModel;
  factory CourseModel.fromJson(Map<String, dynamic> json) =>
      _$CourseModelFromJson(json);

  factory CourseModel.empty() => CourseModel(
        userKey: "",
        docKey: "",
        title: "",
        explanation: "",
        createAt: DateTime.now().toString(),
        updateAt: DateTime.now().toString(),
        tagKeyword: [],
        likeCount: 0,
        likeUserId: [],
        spot: [],
      );
}

@freezed
class CourseSpot with _$CourseSpot {
  const factory CourseSpot({
    required String placeName,
    required String lat,
    required String lon,
  }) = _CourseSpot;
  factory CourseSpot.fromJson(Map<String, dynamic> json) =>
      _$CourseSpotFromJson(json);
  factory CourseSpot.empty() => const CourseSpot(
        placeName: "",
        lat: "",
        lon: "",
      );
}
