import 'package:freezed_annotation/freezed_annotation.dart';

part 'course_model.freezed.dart';

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
    // required List<CourseSpot> spot,
  }) = _CourseModel;

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
        // spot: [],
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

  factory CourseSpot.empty() => const CourseSpot(
        placeName: "",
        addressName: "",
        id: "",
        lat: "",
        lon: "",
      );
}
