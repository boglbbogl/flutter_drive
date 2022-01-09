import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_drive/_constant/timestamp_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'complain_model.freezed.dart';
part 'complain_model.g.dart';

@freezed
class ComplainModel with _$ComplainModel {
  const factory ComplainModel({
    required String userKey,
    required String email,
    required String explanation,
    required String docKey,
    required String category,
    required String answer,
    required bool isAnswer,
    @TimestampConverter() required DateTime createAt,
  }) = _ComplainModel;
  const ComplainModel._();
  factory ComplainModel.fromFireStore(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    return ComplainModel.fromJson(doc.data()!);
  }
  factory ComplainModel.fromJson(Map<String, dynamic> json) =>
      _$ComplainModelFromJson(json);

  factory ComplainModel.empty() => ComplainModel(
        userKey: "",
        category: "",
        isAnswer: false,
        email: "",
        explanation: "",
        docKey: "",
        answer: "",
        createAt: DateTime.now(),
      );
}
