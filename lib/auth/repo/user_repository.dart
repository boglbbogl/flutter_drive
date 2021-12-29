import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_drive/_constant/firebase_keys.dart';
import 'package:flutter_drive/activity/activity_model.dart';
import 'package:flutter_drive/auth/model/user_model.dart';
import 'package:flutter_drive/profile/model/profile_model.dart';

class AuthRepository {
  static final AuthRepository _userRepository = AuthRepository._internal();
  factory AuthRepository() => _userRepository;
  AuthRepository._internal();
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

  Future<List<UserModel>> getAllUserProfile() async {
    final CollectionReference<Map<String, dynamic>> _courseRef =
        _firestore.collection(collectionUser);
    final _snap = await _courseRef.get();
    final _result = _snap.docs.map((e) => UserModel.fromFireStore(e)).toList();
    return _result;
  }

  Future createUserProfile({
    required UserModel userModel,
    required ActivityModel activityModel,
    required String userKey,
  }) async {
    final DocumentReference<Map<String, dynamic>> _userRef =
        _firestore.collection(collectionUser).doc(userKey);
    final DocumentReference<Map<String, dynamic>> _activityRef =
        _firestore.collection(collectionActivity).doc(userKey);

    final DocumentSnapshot _userSnapshot = await _userRef.get();
    final DocumentSnapshot _activitySnapshot = await _userRef.get();
    final _batch = _firestore.batch();
    if (!_userSnapshot.exists && !_activitySnapshot.exists) {
      _batch.set(_userRef, userModel.toJson());
      _batch.set(_activityRef, activityModel.toJson());
      await _batch.commit();
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

    final _batch = _firestore.batch();
    await _courseReference
        .where('userKey', isEqualTo: userKey)
        .get()
        .then((snapshot) {
      for (final element in snapshot.docs) {
        _batch.update(
          FirebaseFirestore.instance
              .collection(collectionCourse)
              .doc(element.id),
          {
            "userProfile": userProfile.toFireStore(),
          },
        );
      }
    });
    _batch.update(_userReference, {
      "socialProfileUrl": userProfile.socialProfileUrl,
      "localProfileUrl": userProfile.localProfileUrl,
      "updatedAt": DateTime.now(),
    });
    await _batch.commit();
  }
}
