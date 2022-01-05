import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/logger.dart';
import 'package:flutter_drive/auth/model/user_model.dart';
import 'package:flutter_drive/comment/model/comment_model.dart';
import 'package:flutter_drive/comment/repo/comment_repository.dart';

class CommentProvider extends ChangeNotifier {
  final CommentRepository _commentRepository = CommentRepository();
  StreamSubscription<List<CommentModel>?>? _courseStreamSubscription;
  StreamSubscription<List<MoreCommentModel>?>? _moreCommentStreamSubscription;
  List<UserModel> _allUserProfile = [];
  List<CommentModel> _commentList = [];
  List<MoreCommentModel> _moreCommentList = [];
  final CommentModel _comment = CommentModel.empty();
  final MoreCommentModel _moreCommentModel = MoreCommentModel.empty();
  String _commentText = "";
  String _moreCommentText = "";
  bool _isShowBottom = false;
  String _commentDocKey = "";
  String _commentMoreDcoKey = "";
  bool _isLongPressed = false;
  int _showMoreCommentIndex = -1;
  UserModel? _moreCommentUser;
  int _isMoreCount = 0;

  CommentProvider(List<UserModel> allUser) {
    _getUserProfile(allUser: allUser);
  }
  void commentProviderDispose() {
    _courseStreamSubscription?.cancel();
  }

  Future getComment({
    required String docKey,
  }) async {
    _courseStreamSubscription?.cancel();
    _courseStreamSubscription =
        _commentRepository.getStreamComment(docKey: docKey).listen((comment) {
      _commentList = comment;
      notifyListeners();
    });
  }

  Future getMoreComment({
    required String courseDocKey,
    required String commentDocKey,
  }) async {
    _moreCommentStreamSubscription?.cancel();
    _moreCommentStreamSubscription = _commentRepository
        .getStreamMoreComment(
            courseDocKey: courseDocKey, commentDocKey: commentDocKey)
        .listen((moreComment) {
      _moreCommentList = moreComment;
      notifyListeners();
    });
  }

  Future _getUserProfile({
    required List<UserModel> allUser,
  }) async {
    _allUserProfile = allUser;
    notifyListeners();
  }

  Future removeComment({
    required String docKey,
  }) async {
    if (_commentDocKey.isEmpty) {
      //show SnackBar
    } else {
      await _commentRepository.removeComment(
          docKey: docKey,
          commentDocKey: _commentDocKey,
          isMoreCount: _isMoreCount);
    }
    notifyListeners();
  }

  Future createComment({
    required String docKey,
    required UserModel userModel,
  }) async {
    await _commentRepository.createComment(
        docKey: docKey,
        commentModel: _comment.copyWith(
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          comment: _commentText,
          userKey: userModel.userKey,
        ));
    notifyListeners();
  }

  Future createMoreComment({
    required String courseDocKey,
    required String userKey,
  }) async {
    await _commentRepository.createMoreComment(
      courseDocKey: courseDocKey,
      commentDocKey: _commentMoreDcoKey,
      moreComment: _moreCommentModel.copyWith(
        userKey: userKey,
        commentUserKey: _moreCommentUser!.userKey,
        comment: _moreCommentText,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    );
    notifyListeners();
  }

  void getMoreComentText({
    required String value,
  }) {
    _moreCommentText = value;
    notifyListeners();
  }

  void showCommentSettingBottom({
    required bool value,
    required String commentDocKey,
    required int isMoreCount,
  }) {
    _isShowBottom = value;
    _commentDocKey = commentDocKey;
    _isMoreCount = isMoreCount;
    notifyListeners();
  }

  void showMoreCommentItem({
    required int index,
  }) {
    _showMoreCommentIndex = index;
    notifyListeners();
  }

  void showLongPressed({
    required bool value,
    required String commentMoreDcoKey,
    required UserModel user,
  }) {
    _isLongPressed = value;
    _commentMoreDcoKey = commentMoreDcoKey;
    _moreCommentUser = user;
    notifyListeners();
  }

  void getCommentText({
    required String value,
  }) {
    _commentText = value;
    notifyListeners();
  }

  CommentModel? get comment => _comment;
  List<CommentModel> get commentList => _commentList;
  List<MoreCommentModel> get moreCommentList => _moreCommentList;

  List<UserModel> get allUserProfile => _allUserProfile;
  bool get isShowBottom => _isShowBottom;
  bool get isLongPressed => _isLongPressed;
  int get showMoreCommentIndex => _showMoreCommentIndex;
  UserModel? get moreCommentUser => _moreCommentUser;
}
