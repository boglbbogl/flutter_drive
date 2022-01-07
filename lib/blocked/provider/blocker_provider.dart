import 'package:flutter/material.dart';
import 'package:flutter_drive/blocked/model/blocked_model.dart';
import 'package:flutter_drive/blocked/repo/blocked_repository.dart';

class BlockedProvider extends ChangeNotifier {
  final BlockedRepository _blockedRepository = BlockedRepository();

  final ContentBlockedModel _contentBlocked = ContentBlockedModel.empty();

  Future sendBlockedFeed() async {
    await _blockedRepository.sendBlocedFeed(contentBlocked: _contentBlocked);
  }
}
