import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_drive/auth/model/user_model.dart';
import 'package:flutter_drive/comment/model/comment_model.dart';
import 'package:flutter_drive/comment/repo/comment_repository.dart';

class CommentProvider extends ChangeNotifier {
  final CommentRepository _commentRepository = CommentRepository();
  StreamSubscription<List<CommentModel>?>? _courseStreamSubscription;
  List<UserModel> _allUserProfile = [];
  List<CommentModel> _commentList = [];
  final CommentModel _comment = CommentModel.empty();
  String _commentText = "";
  bool _isShowBottom = false;
  String _commentDocKey = "";
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
          docKey: docKey, commentDocKey: _commentDocKey);
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

  void showCommentSettingBottom({
    required bool value,
    required String commentDocKey,
  }) {
    _isShowBottom = value;
    _commentDocKey = commentDocKey;
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
  List<UserModel> get allUserProfile => _allUserProfile;
  bool get isShowBottom => _isShowBottom;
}
