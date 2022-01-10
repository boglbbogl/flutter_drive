import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_drive/_constant/firebase_keys.dart';
import 'package:flutter_drive/notification/notification_model.dart';

class NotificationRepository {
  static final NotificationRepository _repository =
      NotificationRepository._internal();
  factory NotificationRepository() => _repository;
  NotificationRepository._internal();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<NotificationModel>> getUserNotification({
    required String userKey,
  }) async {
    final CollectionReference<Map<String, dynamic>> _userNotiRef =
        _firestore.collection(collectionNotification);
    final _snapshot = await _userNotiRef.get();
    final _result = _snapshot.docs
        .map((e) => NotificationModel.fromFireStore(e))
        .where((e) => userKey.contains(e.notiUserKey))
        .where((e) => !e.isHide)
        .toList();
    return _result;
  }

  Future removeUserNotification({
    required String docKey,
  }) async {
    final DocumentReference<Map<String, dynamic>> _userNotiRef =
        _firestore.collection(collectionNotification).doc(docKey);
    await _userNotiRef.delete();
  }
}
