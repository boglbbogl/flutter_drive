import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_drive/_constant/firebase_keys.dart';

class ProfileRepository {
  static final ProfileRepository _repository = ProfileRepository._internal();
  factory ProfileRepository() => _repository;
  ProfileRepository._internal();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future userPofileUpdate({
    required String socialProfileUrl,
    required String localProfileUrl,
    required String nickName,
    required bool isSocialImage,
    required String userKey,
  }) async {
    final DocumentReference<Map<String, dynamic>> _userReference =
        _firestore.collection(collectionUser).doc(userKey);
    final CollectionReference<Map<String, dynamic>> _courseReference =
        _firestore.collection(collectionCourse);

    await _courseReference
        .where('userKey', isEqualTo: userKey)
        .get()
        .then((snapshot) {
      for (final element in snapshot.docs) {
        FirebaseFirestore.instance
            .collection(collectionCourse)
            .doc(element.id)
            .update({
          "user": {
            "socialProfileUrl": socialProfileUrl,
            "localProfileUrl": localProfileUrl,
            "nickName": nickName,
            "isSocialImage": isSocialImage,
          }
        });
      }
    });
    await _userReference.update({
      "socialProfileUrl": socialProfileUrl,
      "localProfileUrl": localProfileUrl,
      "nickName": nickName,
      "updatedAt": DateTime.now().toString(),
    });
  }
}
