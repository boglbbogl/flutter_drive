import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_drive/_constant/firebase_keys.dart';
import 'package:flutter_drive/blocked/model/blocked_model.dart';

class BlockedRepository {
  static final BlockedRepository _repository = BlockedRepository._internal();
  factory BlockedRepository() => _repository;
  BlockedRepository._internal();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future sendBlocedFeed({
    required ContentBlockedModel contentBlocked,
  }) async {
    final DocumentReference<Map<String, dynamic>> _blockedRef =
        _firestore.collection(collectionBlocked).doc();
    final _toWrite = contentBlocked.copyWith(docKey: _blockedRef.id);

    await _blockedRef.set(_toWrite.toJson());
  }
}
