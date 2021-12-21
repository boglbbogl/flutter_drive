import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_drive/_constant/firebase_keys.dart';
import 'package:flutter_drive/auth/model/user_model.dart';
import 'package:flutter_drive/profile/model/profile_model.dart';

class UserRepository {
  static final UserRepository _userRepository = UserRepository._internal();
  factory UserRepository() => _userRepository;
  UserRepository._internal();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserModel?> getUserProfile({
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

  Future createUserProfile({
    required UserModel userModel,
    required String userKey,
  }) async {
    final DocumentReference<Map<String, dynamic>> _documentReference =
        _firestore.collection(collectionUser).doc(userKey);
    final DocumentSnapshot _documentSnapshot = await _documentReference.get();
    if (!_documentSnapshot.exists) {
      _documentReference.set(userModel.toJson());
    }
  }

  Future loginUpdateSocialUserImage({
    required ProfileModel userProfile,
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
          "userProfile": userProfile.toFireStore(),
        });
      }
    });
    await _userReference.update({
      "socialProfileUrl": userProfile.socialProfileUrl,
      "localProfileUrl": userProfile.localProfileUrl,
      "updatedAt": DateTime.now().toString(),
    });
  }
}
