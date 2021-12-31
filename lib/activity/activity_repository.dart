import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_drive/_constant/firebase_keys.dart';
import 'package:flutter_drive/activity/activity_model.dart';

class ActivityRepository {
  static final ActivityRepository _repository = ActivityRepository._internal();
  factory ActivityRepository() => _repository;
  ActivityRepository._internal();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<ActivityModel> getUserActivity({
    required String userKey,
  }) async {
    final DocumentReference<Map<String, dynamic>> _activityRef =
        _firestore.collection(collectionActivity).doc(userKey);
    final DocumentSnapshot<Map<String, dynamic>> _snapshot =
        await _activityRef.get();
    final ActivityModel _activityModel =
        ActivityModel.fromJson(_snapshot.data()!);
    return _activityModel;
  }
}
