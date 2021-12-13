import 'package:flutter_drive/auth/model/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'course_model.g.dart';

@JsonSerializable()
class CourseModel {
  final UserModel user;
  final String docKey;
  final String title;
  final String explanation;
  final String createAt;
  final String updateAt;
  final List<String> tagKeyword;

  CourseModel({
    required this.user,
    required this.docKey,
    required this.title,
    required this.explanation,
    required this.createAt,
    required this.updateAt,
    required this.tagKeyword,
  });
  factory CourseModel.fromJson(Map<String, dynamic> json) =>
      _$CourseModelFromJson(json);
  Map<String, dynamic> toJson() => _$CourseModelToJson(this);
}
