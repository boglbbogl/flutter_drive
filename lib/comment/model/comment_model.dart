import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_drive/_constant/timestamp_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_model.freezed.dart';
part 'comment_model.g.dart';

@freezed
class CommentModel with _$CommentModel {
  const factory CommentModel({
    required String userKey,
    required String comment,
    @TimestampConverter() required DateTime createdAt,
    @TimestampConverter() required DateTime updatedAt,
  }) = _CommentModel;
  const CommentModel._();
  factory CommentModel.fromFireStore(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    return CommentModel.fromJson(doc.data()!);
  }
  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);

  Map<String, dynamic> toFireStore() {
    final map = <String, dynamic>{};
    map["userKey"] = userKey;
    map["comment"] = comment;
    map["createdAt"] = createdAt;
    map["updatedAt"] = updatedAt;
    return map;
  }

  factory CommentModel.empty() => CommentModel(
        userKey: "",
        comment: "",
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
}
