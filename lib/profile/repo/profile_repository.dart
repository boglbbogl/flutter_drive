import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_drive/_constant/firebase_keys.dart';
import 'package:flutter_drive/profile/model/profile_model.dart';

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

  Future<bool> userPofileUpdate({
    required ProfileModel userProfile,
    required String introduction,
    required String userKey,
    required List<String> cars,
    required List<String> deleteCars,
  }) async {
    final DocumentReference<Map<String, dynamic>> _userReference =
        _firestore.collection(collectionUser).doc(userKey);
    // final CollectionReference<Map<String, dynamic>> _courseReference =
    //     _firestore.collection(collectionCourse);
    final _batch = _firestore.batch();
    try {
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
      if (introduction.isNotEmpty) {
        _batch.update(_userReference, {"introduction": introduction});
      }
      if (deleteCars.isNotEmpty) {
        _batch.update(
            _userReference, {"cars": FieldValue.arrayRemove(deleteCars)});
      }
      _batch.update(_userReference, {
        "socialProfileUrl": userProfile.socialProfileUrl,
        "localProfileUrl": userProfile.localProfileUrl,
        "nickName": userProfile.nickName,
        "isSocialImage": userProfile.isSocialImage,
        "cars": FieldValue.arrayUnion(cars),
        "updatedAt": DateTime.now(),
      });
      await _batch.commit();

      return true;
    } catch (error) {
      return false;
    }
  }
}
