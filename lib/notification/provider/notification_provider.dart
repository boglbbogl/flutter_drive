import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/logger.dart';
import 'package:flutter_drive/notification/model/notification_model.dart';
import 'package:flutter_drive/notification/repo/notification_repository.dart';

class NotificationProvider extends ChangeNotifier {
  final NotificationRepository _notificationRepository =
      NotificationRepository();
  List<NotificationModel> _userNotiList = [];
  bool? _isUserLike;
  bool? _isFeedComment;
  bool? _isMoreComment;
  bool? _isFeedLike;
  bool? _isFeedBookmark;
  bool _isLoading = false;

  Future getUserNotiSetting({
    required String userKey,
  }) async {
    final UserNotificationModel? _userSetting =
        await _notificationRepository.getUserNotiSetting(userKey: userKey);
    _isUserLike = _userSetting!.isUserLike;
    _isFeedComment = _userSetting.isComment;
    _isMoreComment = _userSetting.isMoreComment;
    _isFeedLike = _userSetting.isFeedLike;
    _isFeedBookmark = _userSetting.isFeedBookmark;
    notifyListeners();
  }

  Future getUserNotification({
    required String userKey,
  }) async {
    _isLoading = true;
    notifyListeners();
    _userNotiList =
        await _notificationRepository.getUserNotification(userKey: userKey);
    _isLoading = false;
    notifyListeners();
  }

  Future allRemoveNotification({
    required String notiUserKey,
  }) async {
    await _notificationRepository.allNotificationRemove(userKey: notiUserKey);
    _userNotiList = [];
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

  Future userNotificationUpdate({
    required String userKey,
    required BuildContext context,
  }) async {
    await _notificationRepository.userNotificationSettingUpdate(
      userKey: userKey,
      userNotificationModel: UserNotificationModel(
        isUserLike: _isUserLike!,
        isFeedLike: _isFeedLike!,
        isFeedBookmark: _isFeedBookmark!,
        isComment: _isFeedComment!,
        isMoreComment: _isMoreComment!,
      ),
    );
    Navigator.of(context).pop();
  }

  void isUserLikeNoti({required bool value}) {
    _isUserLike = value;
    notifyListeners();
  }

  void isFeedCommentNoti({required bool value}) {
    _isFeedComment = value;
    notifyListeners();
  }

  void isMoreCommentNoti({required bool value}) {
    _isMoreComment = value;
    notifyListeners();
  }

  void isFeedLikeNoti({required bool value}) {
    _isFeedLike = value;
    notifyListeners();
  }

  void isFeedBookmarkNoti({required bool value}) {
    _isFeedBookmark = value;
    notifyListeners();
  }

  List<NotificationModel> get userNotiList => _userNotiList;
  bool get isLoading => _isLoading;
  bool? get isUserLike => _isUserLike;
  bool? get isFeedComment => _isFeedComment;
  bool? get isMoreComment => _isMoreComment;
  bool? get isFeedLike => _isFeedLike;
  bool? get isFeedBookmark => _isFeedBookmark;
}
