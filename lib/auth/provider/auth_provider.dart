import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/logger.dart';
import 'package:flutter_drive/auth/model/user_model.dart';
import 'package:flutter_drive/auth/repo/user_repository.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthProvider extends ChangeNotifier {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final UserRepository _userRepository = UserRepository();

  bool _userStatus = false;
  UserModel? _user;

  AuthProvider() {
    _userLoginState();
  }

  Future<void> _userLoginState() async {
    final User? _firebaseUser = FirebaseAuth.instance.currentUser;
    if (_firebaseUser == null) {
      _userStatus = false;
      notifyListeners();
    } else {
      final _resultUser =
          await _userRepository.getUserProfile(userKey: _firebaseUser.uid);
      if (_resultUser == null) {
        _createUserProfile(_firebaseUser);
        _userStatus = true;
        notifyListeners();
      } else {
        _user = _resultUser;
        _userStatus = true;
        notifyListeners();
      }
    }
  }

  Future<void> _createUserProfile(User user) async {
    final UserRepository _userRepository = UserRepository();
    await _userRepository.createUserProfile(
      userModel: UserModel(
        userKey: user.uid,
        nickName: user.displayName!,
        email: user.email!,
        profileUrl: user.photoURL!,
        createdAt: DateTime.now().toUtc().toString(),
      ),
      userKey: user.uid,
    );
  }

  Future<void> signInWithGoogle() async {
    final _googleSignInUser = await _googleSignIn.signIn();
    if (_googleSignInUser == null) {
      // show snack bar
    } else {
      final _authentication = await _googleSignInUser.authentication;
      final _authCredential = GoogleAuthProvider.credential(
        idToken: _authentication.idToken,
        accessToken: _authentication.accessToken,
      );
      await _firebaseAuth.signInWithCredential(_authCredential);
      _userLoginState();
    }
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _firebaseAuth.signOut();
    _userStatus = false;
    notifyListeners();
  }

  bool get userStatus => _userStatus;
  UserModel? get user => _user;
}
