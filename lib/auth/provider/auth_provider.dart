import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_flushbar.dart';
import 'package:flutter_drive/activity/activity_model.dart';
import 'package:flutter_drive/auth/model/user_model.dart';
import 'package:flutter_drive/auth/repo/user_repository.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk/all.dart' as kakao;

class AuthProvider extends ChangeNotifier {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final AuthRepository _authRepository = AuthRepository();

  UserModel? _user;
  List<UserModel> _allUserProfile = [];
  List<ActivityModel> _allUserActivity = [];
  bool _isLoginState = false;
  bool _isGoogle = false;
  bool _isKakao = false;

  AuthProvider() {
    _userLoginState();
    _getAllUserProfile();
    _getAllUserActivity();
  }

  Future<void> _userLoginState() async {
    _isLoginState = true;
    notifyListeners();
    final User? _firebaseUser = FirebaseAuth.instance.currentUser;
    final kakao.OAuthToken _kakaoToken =
        await kakao.TokenManager.instance.getToken();
    if (_firebaseUser != null) {
      _user = await _authRepository.getUserProfile(userKey: _firebaseUser.uid);
      if (_user != null) {
        if (!_user!.socialProfileUrl.contains(_firebaseUser.photoURL!)) {
          await _updateSoicalUserImage(
              socialProfileUrl: _firebaseUser.photoURL!);
          _user =
              await _authRepository.getUserProfile(userKey: _firebaseUser.uid);
        }
      }
      notifyListeners();
    } else if (_kakaoToken.accessToken != null ||
        _kakaoToken.refreshToken != null) {
      final kakao.User _kakaoUser = await kakao.UserApi.instance.me();
      _user = await _authRepository.getUserProfile(
          userKey: _kakaoUser.id.toString() + _kakaoUser.kakaoAccount!.email!);
      if (_user != null) {
        if (!_user!.socialProfileUrl
            .contains(_kakaoUser.kakaoAccount!.profile!.thumbnailImageUrl!)) {
          await _updateSoicalUserImage(
              socialProfileUrl:
                  _kakaoUser.kakaoAccount!.profile!.thumbnailImageUrl!);
          _user = await _authRepository.getUserProfile(
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

  void getAllUserStatus() {
    _getAllUserProfile();
    _getAllUserActivity();
  }

  Future _getAllUserProfile() async {
    _allUserProfile = await _authRepository.getAllUserProfile();
    notifyListeners();
  }

  Future _getAllUserActivity() async {
    _allUserActivity = await _authRepository.getAllUserActivity();
    notifyListeners();
  }

  Future<void> getUpdateUserProfile({
    required String userKey,
  }) async {
    _user = await _authRepository.getUserProfile(userKey: userKey);
  }

  Future<void> _updateSoicalUserImage({
    required String socialProfileUrl,
  }) async {
    await _authRepository.loginUpdateSocialUserImage(
      socialProfileUrl: socialProfileUrl,
      localProfileUrl: _user!.localProfileUrl,
      userKey: _user!.userKey,
    );
  }

  Future<void> _createUserProfile(
      User? firebaseUser, kakao.User? kakaoUser) async {
    if (firebaseUser != null) {
      await _authRepository.createUserProfile(
        userModel: UserModel(
          userKey: firebaseUser.uid,
          nickName: '${firebaseUser.email!.split('@')[0]}_google',
          email: firebaseUser.email!,
          socialProfileUrl: firebaseUser.photoURL!,
          localProfileUrl: "",
          isSocialImage: true,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          provider: 'Google',
          introduction: "",
          cars: [],
          privacyBookmarks: false,
          privacyLikes: false,
        ),
        activityModel: ActivityModel.empty(),
        userKey: firebaseUser.uid,
      );
    } else if (kakaoUser != null) {
      await _authRepository.createUserProfile(
        userModel: UserModel(
          userKey: kakaoUser.id.toString() + kakaoUser.kakaoAccount!.email!,
          nickName: '${kakaoUser.kakaoAccount!.email!.split('@')[0]}_kakao',
          email: kakaoUser.kakaoAccount!.email!,
          socialProfileUrl: kakaoUser.kakaoAccount!.profile!.profileImageUrl!,
          localProfileUrl: "",
          isSocialImage: true,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          provider: 'Kakao',
          introduction: "",
          cars: [],
          privacyBookmarks: false,
          privacyLikes: false,
        ),
        activityModel: ActivityModel.empty(),
        userKey: kakaoUser.id.toString() + kakaoUser.kakaoAccount!.email!,
      );
    }
  }

  Future<void> signInWithKakao({
    required BuildContext context,
  }) async {
    _isKakao = true;
    notifyListeners();
    final _installed = await kakao.isKakaoTalkInstalled();
    if (!_installed) {
      signInFlushbar(message: '카카오톡이 설치되어 있지 않습니다', color: Colors.amber)
          .show(context);
    } else {
      try {
        final _code = await kakao.AuthCodeClient.instance.requestWithTalk();
        final _token = await kakao.AuthApi.instance.issueAccessToken(_code);
        await kakao.TokenManager.instance.setToken(_token);
        final kakao.User _kakaoUser = await kakao.UserApi.instance.me();
        if (_kakaoUser.kakaoAccount != null) {
          final _resultUser = await _authRepository.getUserProfile(
              userKey:
                  _kakaoUser.id.toString() + _kakaoUser.kakaoAccount!.email!);
          if (_resultUser == null) {
            await _createUserProfile(null, _kakaoUser);
          } else {
            if (!_resultUser.socialProfileUrl.contains(
                _kakaoUser.kakaoAccount!.profile!.thumbnailImageUrl!)) {
              await _updateSoicalUserImage(
                  socialProfileUrl:
                      _kakaoUser.kakaoAccount!.profile!.thumbnailImageUrl!);
            }
          }
          await _userLoginState();
        }
      } catch (error) {
        signInFlushbar(message: '서버 에러가 발생 했습니다', color: Colors.amber)
            .show(context);
        _isKakao = false;
        notifyListeners();
      }
    }
    _isKakao = false;
    notifyListeners();
  }

  Future<void> signInWithGoogle({
    required BuildContext context,
  }) async {
    _isGoogle = true;
    notifyListeners();
    try {
      final _googleSignInUser = await _googleSignIn.signIn();
      if (_googleSignInUser == null) {
        signInFlushbar(
                message: '구글 계정을 가져올 수 없습니다',
                color: Colors.red,
                textColor: Colors.white)
            .show(context);
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
              await _authRepository.getUserProfile(userKey: _firebaseUser.uid);
          if (_resultUser == null) {
            await _createUserProfile(_firebaseUser, null);
          } else {
            if (!_resultUser.socialProfileUrl
                .contains(_firebaseUser.photoURL!)) {
              await _updateSoicalUserImage(
                  socialProfileUrl: _firebaseUser.photoURL!);
            }
          }
          await _userLoginState();
        }
      }
    } catch (error) {
      signInFlushbar(
              message: '서버 에러가 발생 했습니다',
              color: Colors.red,
              textColor: Colors.white)
          .show(context);
      _isGoogle = false;
      notifyListeners();
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
  List<UserModel> get allUserProfile => _allUserProfile;
  List<ActivityModel> get allUserActivity => _allUserActivity;
}
