import 'package:flutter/material.dart';
import 'package:flutter_drive/notification/notification_model.dart';
import 'package:flutter_drive/notification/notification_repository.dart';

class NotificationProvider extends ChangeNotifier {
  final NotificationRepository _notificationRepository =
      NotificationRepository();
  List<NotificationModel> _userNotiList = [];

  Future getUserNotification({
    required String userKey,
  }) async {
    _userNotiList =
        await _notificationRepository.getUserNotification(userKey: userKey);
    notifyListeners();
  }

  Future removeUserNotification({
    required NotificationModel notificationModel,
  }) async {
    _userNotiList.remove(notificationModel);
    await _notificationRepository.removeUserNotification(
        docKey: notificationModel.docKey);
    notifyListeners();
  }

  List<NotificationModel> get userNotiList => _userNotiList;
}
