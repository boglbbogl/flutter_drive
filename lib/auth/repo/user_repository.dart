import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_drive/_constant/firebase_keys.dart';
import 'package:flutter_drive/auth/model/user_model.dart';

class UserRepository {
  static final UserRepository _userRepository = UserRepository._internal();
  factory UserRepository() => _userRepository;
  UserRepository._internal();

  Future<UserModel?> getUserProfile({
    required String userKey,
  }) async {
    final DocumentReference<Map<String, dynamic>> _documentReference =
        FirebaseFirestore.instance.collection(collectionUser).doc(userKey);
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
        FirebaseFirestore.instance.collection(collectionUser).doc(userKey);
    final DocumentSnapshot _documentSnapshot = await _documentReference.get();
    if (!_documentSnapshot.exists) {
      _documentReference.set(userModel.toJson());
    }
  }
}
