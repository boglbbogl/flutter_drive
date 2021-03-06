import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_flushbar.dart';
import 'package:flutter_drive/activity/activity_model.dart';
import 'package:flutter_drive/auth/model/user_model.dart';
import 'package:flutter_drive/auth/repo/user_repository.dart';
import 'package:flutter_drive/notification/model/notification_model.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk/all.dart' as kakao;

class AuthProvider extends ChangeNotifier {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final AuthRepository _authRepository = AuthRepository();

  UserModel? _user;
  ActivityModel? _activityModel;
  List<UserModel> _allUserProfile = [];
  List<ActivityModel> _allUserActivity = [];
  bool _isLoginState = false;
  bool _isGoogle = false;
  bool _isKakao = false;
  bool _isUserLoading = false;

  AuthProvider() {
    _userLoginState();
    // getAllUserStatus();
  }

  Future<void> _userLoginState() async {
    _isLoginState = true;
    notifyListeners();
    final User? _firebaseUser = FirebaseAuth.instance.currentUser;
    final kakao.OAuthToken _kakaoToken =
        await kakao.TokenManager.instance.getToken();
    if (_firebaseUser != null) {
      await _getSingleUserStatus(userKey: _firebaseUser.uid);
      if (_user != null) {
        if (!_user!.socialProfileUrl.contains(_firebaseUser.photoURL!)) {
          await _updateSoicalUserImage(
              socialProfileUrl: _firebaseUser.photoURL!);
          await _getSingleUserStatus(userKey: _firebaseUser.uid);
        }
        await getAllUserStatus();
      }
      notifyListeners();
    } else if (_kakaoToken.accessToken != null ||
        _kakaoToken.refreshToken != null) {
      final kakao.User _kakaoUser = await kakao.UserApi.instance.me();
      await _getSingleUserStatus(
          userKey: _kakaoUser.id.toString() + _kakaoUser.kakaoAccount!.email!);
      if (_user != null) {
        if (!_user!.socialProfileUrl
            .contains(_kakaoUser.kakaoAccount!.profile!.thumbnailImageUrl!)) {
          await _updateSoicalUserImage(
              socialProfileUrl:
                  _kakaoUser.kakaoAccount!.profile!.thumbnailImageUrl!);
          await _getSingleUserStatus(
              userKey:
                  _kakaoUser.id.toString() + _kakaoUser.kakaoAccount!.email!);
        }
        await getAllUserStatus();
      }
      notifyListeners();
    } else {
      _user = null;
      _isLoginState = false;
      notifyListeners();
    }
  }

  Future<void> getSingleUserProfile({
    required String userKey,
  }) async {
    _user = await _authRepository.getUserProfile(userKey: userKey);
    notifyListeners();
  }

  Future<void> getSingleUserActivity({
    required String userKey,
  }) async {
    _activityModel = await _authRepository.getUserActivity(userKey: userKey);
    notifyListeners();
  }

  Future<void> _getSingleUserStatus({
    required String userKey,
  }) async {
    await getSingleUserProfile(userKey: userKey);
    await getSingleUserActivity(userKey: userKey);
    notifyListeners();
  }

  Future<void> getAllUserStatus() async {
    _isUserLoading = true;
    notifyListeners();
    await _getAllUserProfile();
    await _getAllUserActivity();
    _isUserLoading = false;
    notifyListeners();
  }

  Future<void> getAllUserFeedUpdateUserModel({
    required String userKey,
  }) async {
    if (_allUserProfile.isEmpty) {
      await _getAllUserProfile();
    }
    final UserModel _deleteUserModel =
        _allUserProfile.where((e) => userKey.contains(e.userKey)).toList()[0];
    final _updateUser = await _authRepository.getUserProfile(userKey: userKey);
    if (_updateUser != null) {
      _allUserProfile.remove(_deleteUserModel);
      _allUserProfile.add(_updateUser);
      notifyListeners();
    }
  }

  Future<void> getAllUserFeedUpdateActivityModel({
    required String userKey,
  }) async {
    if (_allUserActivity.isEmpty) {
      await _getAllUserActivity();
    }
    final ActivityModel _deleteActivityModel =
        _allUserActivity.where((e) => userKey.contains(e.userKey)).toList()[0];
    final _updateActivityModel =
        await _authRepository.getUserActivity(userKey: userKey);
    if (_updateActivityModel != null) {
      _allUserActivity.remove(_deleteActivityModel);
      _allUserActivity.add(_updateActivityModel);

      notifyListeners();
    }
  }

  Future<void> getAllUserFeedUpdateStatus({
    required String userKey,
  }) async {
    _isUserLoading = true;
    notifyListeners();
    await getAllUserFeedUpdateUserModel(userKey: userKey);
    await getAllUserFeedUpdateActivityModel(userKey: userKey);
    _isUserLoading = false;
    notifyListeners();
  }

  Future _getAllUserProfile() async {
    _allUserProfile = await _authRepository.getAllUserProfile();
    notifyListeners();
  }

  Future _getAllUserActivity() async {
    _allUserActivity = await _authRepository.getAllUserActivity();
    notifyListeners();
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
          city: [],
          privacyBookmarks: false,
          privacyLikes: false,
        ),
        activityModel: ActivityModel.empty(),
        userNotificationModel: UserNotificationModel.empty(),
        userKey: firebaseUser.uid,
      );
    } else if (kakaoUser != null) {
      await _authRepository.createUserProfile(
        userModel: UserModel(
          userKey: kakaoUser.id.toString() + kakaoUser.kakaoAccount!.email!,
          nickName: '${kakaoUser.kakaoAccount!.email!.split('@')[0]}_kakao',
          email: kakaoUser.kakaoAccount!.email!,
          socialProfileUrl: kakaoUser.kakaoAccount!.profile!.thumbnailImageUrl!,
          localProfileUrl: "",
          isSocialImage: true,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          provider: 'Kakao',
          introduction: "",
          cars: [],
          city: [],
          privacyBookmarks: false,
          privacyLikes: false,
        ),
        activityModel: ActivityModel.empty(),
        userNotificationModel: UserNotificationModel.empty(),
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
      signInFlushbar(message: '??????????????? ???????????? ?????? ????????????', color: Colors.amber)
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
        signInFlushbar(message: '?????? ????????? ?????? ????????????', color: Colors.amber)
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
                message: '?????? ????????? ????????? ??? ????????????',
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
              message: '?????? ????????? ?????? ????????????',
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
    _isLoginState = false;
    notifyListeners();

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
    notifyListeners();
  }

  UserModel? get user => _user;
  ActivityModel? get activity => _activityModel;
  bool get isLoginState => _isLoginState;
  bool get isGoogle => _isGoogle;
  bool get isKakao => _isKakao;
  List<UserModel> get allUserProfile => _allUserProfile;
  List<ActivityModel> get allUserActivity => _allUserActivity;
  bool get isUserLoading => _isUserLoading;
}
