import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_flushbar.dart';
import 'package:flutter_drive/blocked/model/blocked_model.dart';
import 'package:flutter_drive/blocked/repo/blocked_repository.dart';

class BlockedProvider extends ChangeNotifier {
  final BlockedRepository _blockedRepository = BlockedRepository();
  final ContentBlockedModel _contentBlocked = ContentBlockedModel.empty();

  Future sendBlockedFeed({
    required String userKey,
    required String email,
    required String blockedDocKey,
    required String feedCause,
    required BuildContext context,
  }) async {
    if (userKey.isNotEmpty && feedCause.contains("내 피드에서 컨텐츠 안보기")) {
      await _blockedRepository.contentMyFeedBlocked(
          userKey: userKey, blockedDocKey: blockedDocKey);
      Navigator.of(context).pop();
      appFlushbar(message: '해당 컨텐츠는 더 이상 노출되지 않습니다').show(context);
    } else {
      await _blockedRepository.sendContentFeedBlocked(
          contentBlocked: _contentBlocked.copyWith(
        userKey: userKey,
        email: email,
        blockedDocKey: blockedDocKey,
        cause: feedCause,
      ));
      Navigator.of(context).pop();
      appFlushbar(message: '신고가 접수 되었습니다').show(context);
    }
  }
}
