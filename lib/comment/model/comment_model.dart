import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_drive/_constant/timestamp_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_model.freezed.dart';
part 'comment_model.g.dart';

@freezed
class CommentModel with _$CommentModel {
  const factory CommentModel({
    required String userKey,
    required String docKey,
    required String comment,
    required int isMoreCount,
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
    map["docKey"] = docKey;
    map["comment"] = comment;
    map["isMoreCount"] = isMoreCount;
    map["createdAt"] = createdAt;
    map["updatedAt"] = updatedAt;
    return map;
  }

  factory CommentModel.empty() => CommentModel(
        userKey: "",
        docKey: "",
        comment: "",
        isMoreCount: 0,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
}

@freezed
class MoreCommentModel with _$MoreCommentModel {
  const factory MoreCommentModel({
    required String userKey,
    required String commentUserKey,
    required String docKey,
    required String commentDocKey,
    required String comment,
    required int isMoreCount,
    @TimestampConverter() required DateTime createdAt,
    @TimestampConverter() required DateTime updatedAt,
  }) = _MoreCommentModel;

  const MoreCommentModel._();

  factory MoreCommentModel.fromFireStore(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    return MoreCommentModel.fromJson(doc.data()!);
  }
  factory MoreCommentModel.fromJson(Map<String, dynamic> json) =>
      _$MoreCommentModelFromJson(json);

  Map<String, dynamic> toFireStore() {
    final map = <String, dynamic>{};
    map["userKey"] = userKey;
    map["commentUserKey"] = commentUserKey;
    map["docKey"] = docKey;
    map["commentDocKey"] = commentDocKey;
    map["comment"] = comment;
    map["isMoreCount"] = isMoreCount;
    map["createdAt"] = createdAt;
    map["updatedAt"] = updatedAt;
    return map;
  }

  factory MoreCommentModel.empty() => MoreCommentModel(
        userKey: "",
        commentUserKey: "",
        docKey: "",
        comment: "",
        commentDocKey: "",
        isMoreCount: 0,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
}
