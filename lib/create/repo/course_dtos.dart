import 'package:flutter_drive/create/model/course_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'course_dtos.freezed.dart';
part 'course_dtos.g.dart';

@freezed
class CourseDto with _$CourseDto {
  const factory CourseDto({
    required String userKey,
    required String docKey,
    required String explanation,
    required String createAt,
    required String updateAt,
    required List<String> tagKeyword,
    required int likeCount,
    required List<String> likeUserId,
    // required List<CourseSpotDto> spot,
  }) = _CourseDto;
  const CourseDto._();
  factory CourseDto.fromJson(Map<String, dynamic> json) =>
      _$CourseDtoFromJson(json);

  factory CourseDto.toFirestore(CourseModel c) => CourseDto(
        userKey: c.userKey,
        docKey: c.docKey,
        explanation: c.explanation,
        createAt: c.createAt,
        updateAt: c.updateAt,
        tagKeyword: c.tagKeyword,
        likeCount: c.likeCount,
        likeUserId: c.likeUserId,
        // spot: c.spot.map((e) => CourseSpotDto.toFireStore(e)).toList(),
      );
}

@freezed
class CourseSpotDto with _$CourseSpotDto {
  const factory CourseSpotDto({
    required String placeName,
    required String addressName,
    required String id,
    required String lat,
    required String lon,
  }) = _CourseSpotDto;

  const CourseSpotDto._();
  factory CourseSpotDto.fromJson(Map<String, dynamic> json) =>
      _$CourseSpotDtoFromJson(json);

  factory CourseSpotDto.toFireStore(CourseSpot s) => CourseSpotDto(
        placeName: s.placeName,
        addressName: s.addressName,
        id: s.id,
        lat: s.lat,
        lon: s.lon,
      );
}
