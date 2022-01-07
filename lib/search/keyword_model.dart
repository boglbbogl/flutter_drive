import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'keyword_model.freezed.dart';
part 'keyword_model.g.dart';

@freezed
class KeywordModel with _$KeywordModel {
  const factory KeywordModel({
    required List<String> srcKeyword,
    required List<String> tagKeyword,
  }) = _KeywordModel;
  factory KeywordModel.fromJson(Map<String, dynamic> json) =>
      _$KeywordModelFromJson(json);
  factory KeywordModel.fromFireStore(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    return KeywordModel.fromJson(doc.data()!);
  }
}
