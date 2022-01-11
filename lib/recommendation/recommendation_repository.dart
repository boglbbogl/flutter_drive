import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_drive/_constant/firebase_keys.dart';
import 'package:flutter_drive/recommendation/recommendation_model.dart';
import 'package:flutter_drive/search/keyword_model.dart';

class RecommendationRepository {
  static final RecommendationRepository _repository =
      RecommendationRepository._internal();
  factory RecommendationRepository() => _repository;
  RecommendationRepository._internal();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<RouteCourseModel>> getRouteCourseList() async {
    final CollectionReference<Map<String, dynamic>> _recommendationCourseRef =
        _firestore.collection(collectionRecommendationCourse);

    final _result = await _recommendationCourseRef.get().then((snapshot) =>
        snapshot.docs.map((e) => RouteCourseModel.fromJson(e.data())).toList());
    return _result;
  }

  Future<List> getRecommandationSrcKeyword() async {
    final List _srcKeyword = [];
    final DocumentReference<Map<String, dynamic>> _recommendRef = _firestore
        .collection(collectionRecommendation)
        .doc(documentKeywordRecommendation);
    final _snapshot = await _recommendRef.get();
    final _data = _snapshot.data()!["srcKeyword"];
    for (final i in _data) {
      _srcKeyword.add(i);
    }
    return _srcKeyword;
  }

  Future<List<KeywordModel>> getSrcKeyword() async {
    final CollectionReference<Map<String, dynamic>> _keywordRef =
        _firestore.collection(collectionKeyword);
    final _snapshot = await _keywordRef.get();
    final _result =
        _snapshot.docs.map((e) => KeywordModel.fromFireStore(e)).toList();
    return _result;
  }
}
