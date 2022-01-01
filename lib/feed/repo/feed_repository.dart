import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_drive/_constant/firebase_keys.dart';
import 'package:flutter_drive/auth/model/user_model.dart';
import 'package:flutter_drive/course/model/course_model.dart';

class FeedRepostiory {
  static final FeedRepostiory _repostiory = FeedRepostiory._internal();
  factory FeedRepostiory() => _repostiory;
  FeedRepostiory._internal();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<CourseModel>> getStreamCourse() async* {
    final CollectionReference<Map<String, dynamic>> _collectionRef =
        _firestore.collection(collectionCourse);
    yield* _collectionRef
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((sn) {
      return sn.docs.map((doc) {
        return CourseModel.fromFireStore(doc);
      }).toList();
    });
  }

  Future<UserModel?> getFeedUserProfile({
    required String userKey,
  }) async {
    final DocumentReference<Map<String, dynamic>> _documentReference =
        _firestore.collection(collectionUser).doc(userKey);
    final DocumentSnapshot<Map<String, dynamic>> _documentSnapshot =
        await _documentReference.get();
    if (_documentSnapshot.exists) {
      final UserModel userModel = UserModel.fromJson(_documentSnapshot.data()!);
      return userModel;
    }
    return null;
  }
}
