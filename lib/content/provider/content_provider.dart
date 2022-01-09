import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_flushbar.dart';
import 'package:flutter_drive/_constant/logger.dart';
import 'package:flutter_drive/content/repo/content_repository.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

class ContentProvider extends ChangeNotifier {
  final ContentRepository _contentRepository = ContentRepository();
  String _docKey = "";
  String _explanation = "";
  bool _isLoading = false;

  Future contentFeedDelete({
    required bool isMe,
    required String userKey,
    required List<String> moreCommentDocKey,
    required BuildContext context,
  }) async {
    _isLoading = true;
    notifyListeners();
    if (_docKey.isNotEmpty && isMe) {
      await _contentRepository.contentFeedDelete(
          docKeyList: moreCommentDocKey, docKey: _docKey, userKey: userKey);
      Phoenix.rebirth(context);
    } else {
      appFlushbar(message: "삭제하지 못했습니다. 잠시 후 다시 사용 바랍니다").show(context);
    }
    _isLoading = false;
    notifyListeners();
  }

  Future contentFeedUpdate({
    required bool isMe,
    required BuildContext context,
  }) async {
    _isLoading = true;
    notifyListeners();
    if (_docKey.isNotEmpty && isMe) {
      await _contentRepository.contentFeedUpdate(
          docKey: _docKey, explanation: _explanation);
      Navigator.of(context).pop();
    } else {
      appFlushbar(message: "수정하지 못했습니다. 잠시 후 다시 사용 바랍니다").show(context);
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

  Future bookmarkAddAndRemove({
    required String docKey,
    required String userKey,
    required bool isBookmark,
  }) async {
    if (isBookmark) {
      await _contentRepository.removeBookmark(docKey: docKey, userKey: userKey);
    } else {
      await _contentRepository.addBookmark(docKey: docKey, userKey: userKey);
    }
  }

  Future likeAddAndRemove({
    required String docKey,
    required String userKey,
    required bool isLike,
  }) async {
    logger.d(isLike);
    if (isLike) {
      await _contentRepository.removeLike(docKey: docKey, userKey: userKey);
    } else {
      await _contentRepository.addLike(docKey: docKey, userKey: userKey);
    }
  }

  void getDocKey({
    required String docKey,
  }) {
    _docKey = docKey;
    notifyListeners();
  }

  String get explanation => _explanation;
  bool get isLoading => _isLoading;
}
