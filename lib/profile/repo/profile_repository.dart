import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_drive/_constant/firebase_keys.dart';
import 'package:flutter_drive/auth/model/user_model.dart';

class ProfileRepository {
  static final ProfileRepository _repository = ProfileRepository._internal();
  factory ProfileRepository() => _repository;
  ProfileRepository._internal();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> getUsersNickNameDuplication({
    required String nickName,
  }) async {
    final CollectionReference<Map<String, dynamic>> _userReference =
        _firestore.collection(collectionUser);
    final _usersNickName = await _userReference
        .where('nickName')
        .get()
        .then((value) => value.docs.map((e) => e.data()['nickName']));
    return _usersNickName.contains(nickName);
  }

  Future profilePrivacyUpdate({
    required String userkey,
    required bool privacyLikes,
    required bool privacyBookmarks,
  }) async {
    final DocumentReference<Map<String, dynamic>> _userRef =
        _firestore.collection(collectionUser).doc(userkey);
    await _userRef.update({
      "privacyLikes": privacyLikes,
      "privacyBookmarks": privacyBookmarks,
      "updatedAt": DateTime.now(),
    });
  }

  Future profileIntroductionUpdate({
    required String userKey,
    required String introduction,
  }) async {
    final DocumentReference<Map<String, dynamic>> _userRef =
        _firestore.collection(collectionUser).doc(userKey);
    final _batch = _firestore.batch();
    _batch.update(_userRef, {"introduction": introduction});
    _batch.update(_userRef, {"updatedAt": DateTime.now()});
    await _batch.commit();
  }

  Future profileCarsUpdate({
    required List<String> deleteCars,
    required List<String> addCars,
    required String userKey,
  }) async {
    final DocumentReference<Map<String, dynamic>> _userRef =
        _firestore.collection(collectionUser).doc(userKey);
    final _batch = _firestore.batch();
    if (deleteCars.isNotEmpty) {
      _batch.update(_userRef, {"cars": FieldValue.arrayRemove(deleteCars)});
    }
    _batch.update(_userRef, {"cars": FieldValue.arrayUnion(addCars)});
    _batch.update(_userRef, {"updatedAt": DateTime.now()});
    await _batch.commit();
  }

  Future profileCityUpdate({
    required List<String> deleteCity,
    required List<String> addCity,
    required String userKey,
  }) async {
    final DocumentReference<Map<String, dynamic>> _userRef =
        _firestore.collection(collectionUser).doc(userKey);
    final _batch = _firestore.batch();
    if (deleteCity.isNotEmpty) {
      _batch.update(_userRef, {"city": FieldValue.arrayRemove(deleteCity)});
    }
    _batch.update(_userRef, {"city": FieldValue.arrayUnion(addCity)});
    _batch.update(_userRef, {"updatedAt": DateTime.now()});
    await _batch.commit();
  }

  Future userPofileUpdate({
    required UserModel userModel,
    required String userKey,
  }) async {
    final DocumentReference<Map<String, dynamic>> _userReference =
        _firestore.collection(collectionUser).doc(userKey);
    final _batch = _firestore.batch();
    // await _courseReference
    //     .where('userKey', isEqualTo: userKey)
    //     .get()
    //     .then((snapshot) async {
    //   for (final element in snapshot.docs) {
    //     _batch
    //         .update(_firestore.collection(collectionCourse).doc(element.id), {
    //       "userProfile": userProfile.toFireStore(),
    //     });
    //   }
    // });

    _batch.update(_userReference, {
      "socialProfileUrl": userModel.socialProfileUrl,
      "localProfileUrl": userModel.localProfileUrl,
      "nickName": userModel.nickName,
      "isSocialImage": userModel.isSocialImage,
      "updatedAt": DateTime.now(),
    });
    await _batch.commit();
  }
}
