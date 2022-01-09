import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_drive/_constant/firebase_keys.dart';
import 'package:flutter_drive/setting/model/complain_model.dart';

class SettingRepository {
  static final SettingRepository _repostiory = SettingRepository._internal();
  factory SettingRepository() => _repostiory;
  SettingRepository._internal();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<ComplainModel>> getUserComplainList({
    required String userKey,
  }) async {
    final CollectionReference<Map<String, dynamic>> _complainRef =
        _firestore.collection(collectionComplain);
    final _snapshot = await _complainRef.get();
    final _result = _snapshot.docs
        .map((e) => ComplainModel.fromFireStore(e))
        .where((e) => userKey.contains(e.userKey))
        .toList();
    return _result;
  }

  Future sendUserComplain({
    required ComplainModel complain,
  }) async {
    final DocumentReference<Map<String, dynamic>> _complainRef =
        _firestore.collection(collectionComplain).doc();

    final _toWrite = complain.copyWith(docKey: _complainRef.id);
    await _complainRef.set(_toWrite.toJson());
  }
}
