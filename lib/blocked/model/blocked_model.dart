import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_drive/_constant/timestamp_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'blocked_model.freezed.dart';
part 'blocked_model.g.dart';

@freezed
class ContentBlockedModel with _$ContentBlockedModel {
  const factory ContentBlockedModel({
    required String userKey,
    required String email,
    required String blockedDocKey,
    required String docKey,
    required String cause,
    required String category,
    required bool isCheck,
    @TimestampConverter() required DateTime createdAt,
  }) = _ContentBlockedModel;
  factory ContentBlockedModel.fromJson(Map<String, dynamic> json) =>
      _$ContentBlockedModelFromJson(json);
  const ContentBlockedModel._();
  factory ContentBlockedModel.fromFireStore(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    return ContentBlockedModel.fromJson(doc.data()!);
  }
  factory ContentBlockedModel.empty() => ContentBlockedModel(
        userKey: "",
        email: "",
        blockedDocKey: "",
        docKey: "",
        cause: "",
        category: "content",
        isCheck: false,
        createdAt: DateTime.now(),
      );
}
