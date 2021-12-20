import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/logger.dart';
import 'package:flutter_drive/auth/model/user_model.dart';
import 'package:flutter_drive/auth/repo/user_repository.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk/all.dart' as kakao;

class AuthProvider extends ChangeNotifier {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final UserRepository _userRepository = UserRepository();

  UserModel? _user;
  bool _isLoginState = false;
  bool _isGoogle = false;
  bool _isKakao = false;

  AuthProvider() {
    _userLoginState();
  }

  Future<void> _userLoginState() async {
    _isLoginState = true;
    notifyListeners();
    final User? _firebaseUser = FirebaseAuth.instance.currentUser;
    final kakao.OAuthToken _kakaoToken =
        await kakao.TokenManager.instance.getToken();
    if (_firebaseUser != null) {
      _user = await _userRepository.getUserProfile(userKey: _firebaseUser.uid);
      if (_user != null) {
        if (!_user!.profileUrl.contains(_firebaseUser.photoURL!)) {
          await _userRepository.updateUserProfileImage(
              profileUrl: _firebaseUser.photoURL!, userKey: _firebaseUser.uid);
          _user =
              await _userRepository.getUserProfile(userKey: _firebaseUser.uid);
        }
      }
      notifyListeners();
    } else if (_kakaoToken.accessToken != null ||
        _kakaoToken.refreshToken != null) {
      final kakao.User _kakaoUser = await kakao.UserApi.instance.me();
      _user = await _userRepository.getUserProfile(
          userKey: _kakaoUser.id.toString() + _kakaoUser.kakaoAccount!.email!);
      if (_user != null) {
        if (!_user!.profileUrl
            .contains(_kakaoUser.kakaoAccount!.profile!.thumbnailImageUrl!)) {
          await _userRepository.updateUserProfileImage(
              profileUrl: _kakaoUser.kakaoAccount!.profile!.thumbnailImageUrl!,
              userKey:
                  _kakaoUser.id.toString() + _kakaoUser.kakaoAccount!.email!);
          _user = await _userRepository.getUserProfile(
              userKey:
                  _kakaoUser.id.toString() + _kakaoUser.kakaoAccount!.email!);
        }
      }
      notifyListeners();
    } else {
      _user = null;
      _isLoginState = false;
      notifyListeners();
    }
  }

  Future<void> _createUserProfile(
      User? firebaseUser, kakao.User? kakaoUser) async {
    if (firebaseUser != null) {
      await _userRepository.createUserProfile(
        userModel: UserModel(
          userKey: firebaseUser.uid,
          nickName: firebaseUser.displayName!,
          email: firebaseUser.email!,
          profileUrl: firebaseUser.photoURL!,
          createdAt: DateTime.now().toString(),
          updatedAt: DateTime.now().toString(),
          provider: 'Google',
        ),
        userKey: firebaseUser.uid,
      );
    } else if (kakaoUser != null) {
      await _userRepository.createUserProfile(
        userModel: UserModel(
          userKey: kakaoUser.id.toString() + kakaoUser.kakaoAccount!.email!,
          nickName: kakaoUser.kakaoAccount!.profile!.nickname,
          email: kakaoUser.kakaoAccount!.email!,
          profileUrl: kakaoUser.kakaoAccount!.profile!.profileImageUrl!,
          createdAt: DateTime.now().toString(),
          updatedAt: DateTime.now().toString(),
          provider: 'Kakao',
        ),
        userKey: kakaoUser.id.toString() + kakaoUser.kakaoAccount!.email!,
      );
    }
  }

  Future<void> signInWithKakao() async {
    _isKakao = true;
    notifyListeners();
    final _installed = await kakao.isKakaoTalkInstalled();
    if (!_installed) {
    } else {
      try {
        final _code = await kakao.AuthCodeClient.instance.requestWithTalk();
        final _token = await kakao.AuthApi.instance.issueAccessToken(_code);
        await kakao.TokenManager.instance.setToken(_token);
        final kakao.User _kakaoUser = await kakao.UserApi.instance.me();
        if (_kakaoUser.kakaoAccount != null) {
          final _resultUser = await _userRepository.getUserProfile(
              userKey:
                  _kakaoUser.id.toString() + _kakaoUser.kakaoAccount!.email!);
          if (_resultUser == null) {
            await _createUserProfile(null, _kakaoUser);
          } else {
            if (!_resultUser.profileUrl.contains(
                _kakaoUser.kakaoAccount!.profile!.thumbnailImageUrl!)) {
              await _userRepository.updateUserProfileImage(
                  profileUrl:
                      _kakaoUser.kakaoAccount!.profile!.thumbnailImageUrl!,
                  userKey: _kakaoUser.id.toString() +
                      _kakaoUser.kakaoAccount!.email!);
            }
          }
          await _userLoginState();
        }
      } catch (error) {
        _isKakao = false;
        notifyListeners();
      }
    }
    _isKakao = false;
    notifyListeners();
  }

  Future<void> signInWithGoogle() async {
    _isGoogle = true;
    notifyListeners();
    try {
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
            await _createUserProfile(_firebaseUser, null);
          } else {
            if (!_resultUser.profileUrl.contains(_firebaseUser.photoURL!)) {
              await _userRepository.updateUserProfileImage(
                  profileUrl: _firebaseUser.photoURL!,
                  userKey: _firebaseUser.uid);
            }
          }
          await _userLoginState();
        }
      }
    } catch (error) {
      logger.e(error);
    }
    _isGoogle = false;
    notifyListeners();
  }

  Future<void> signOut({required String provider}) async {
    if (provider.contains('Google')) {
      await _googleSignIn.signOut();
      await _firebaseAuth.signOut();
      _user = null;
      notifyListeners();
    } else if (provider.contains('Kakao')) {
      await kakao.UserApi.instance.logout();
      await kakao.TokenManager.instance.clear();
      _user = null;
      notifyListeners();
    } else {}
    _isLoginState = false;
  }

  UserModel? get user => _user;
  bool get isLoginState => _isLoginState;
  bool get isGoogle => _isGoogle;
  bool get isKakao => _isKakao;
}
