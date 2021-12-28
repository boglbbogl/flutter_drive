import 'package:flutter/material.dart';
import 'package:flutter_drive/content/repo/content_repository.dart';

class ContentProvider extends ChangeNotifier {
  final ContentRepository _contentRepository = ContentRepository();
  bool _isClickLiked = false;
  String _docKey = "";
  String _explanation = "";
  bool _isLoading = false;

  Future contentFeedDelete({
    required bool isMe,
  }) async {
    if (_docKey.isNotEmpty && isMe) {
      await _contentRepository.contentFeedDelete(docKey: _docKey);
    } else {
      //show Snackbar
    }
  }

  Future contentFeedUpdate({
    required bool isMe,
  }) async {
    _isLoading = true;
    notifyListeners();
    if (_docKey.isNotEmpty && isMe) {
      await _contentRepository.contentFeedUpdate(
          docKey: _docKey, explanation: _explanation);
    } else {
      //show Snackbar

    }
    _isLoading = false;
    notifyListeners();
  }

  void updateExplanationText({
    required String value,
  }) {
    _explanation = value;
    notifyListeners();
  }

  Future addAndRemove({
    required String docKey,
    required String userKey,
    required bool isLike,
  }) async {
    _isClickLiked = true;
    notifyListeners();
    if (isLike) {
      await _contentRepository.removeLike(docKey: docKey, userKey: userKey);
    } else {
      await _contentRepository.addLike(docKey: docKey, userKey: userKey);
    }
    _isClickLiked = false;
    notifyListeners();
  }

  void getDocKey({
    required String docKey,
  }) {
    _docKey = docKey;
    notifyListeners();
  }

  bool get isClickLiked => _isClickLiked;
  String get explanation => _explanation;
  bool get isLoading => _isLoading;
}
