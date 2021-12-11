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

  UserModel? _user;
  bool _isGoogle = false;
  bool _isKakao = false;

  AuthProvider() {
    _userLoginState();
  }

  Future<void> _userLoginState() async {
    final User? _firebaseUser = FirebaseAuth.instance.currentUser;
    if (_firebaseUser == null) {
      _user = null;
      notifyListeners();
    } else {
      _user = await _userRepository.getUserProfile(userKey: _firebaseUser.uid);
      notifyListeners();
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
        provider: 'google',
      ),
      userKey: user.uid,
    );
  }

  Future<void> signInWithKakao() async {
    _isKakao = true;
    notifyListeners();
    await Future.delayed(const Duration(milliseconds: 3000));
    _isKakao = false;
    notifyListeners();
  }

  Future<void> signInWithGoogle() async {
    _isGoogle = true;
    notifyListeners();
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
      final User? _firebaseUser = FirebaseAuth.instance.currentUser;
      if (_firebaseUser != null) {
        final _resultUser =
            await _userRepository.getUserProfile(userKey: _firebaseUser.uid);
        if (_resultUser == null) {
          await _createUserProfile(_firebaseUser);
        }
        await _userLoginState();
      }
    }
    _isGoogle = false;
    notifyListeners();
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _firebaseAuth.signOut();
    _user = null;
    notifyListeners();
  }

  UserModel? get user => _user;
  bool get isGoogle => _isGoogle;
  bool get isKakao => _isKakao;
}
