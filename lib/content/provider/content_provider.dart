import 'package:flutter/material.dart';
import 'package:flutter_drive/content/repo/content_repository.dart';

class ContentProvider extends ChangeNotifier {
  final ContentRepository _contentRepository = ContentRepository();
  bool _clickLiked = false;

  Future incrementAndDecrement({
    required String docKey,
    required String userKey,
    required bool isLike,
  }) async {
    _clickLiked = true;
    notifyListeners();
    if (isLike) {
      await _contentRepository.decrementLike(docKey: docKey, userKey: userKey);
    } else {
      await _contentRepository.incrementLike(docKey: docKey, userKey: userKey);
    }
    _clickLiked = false;
    notifyListeners();
  }

  bool get clickLiked => _clickLiked;
}
