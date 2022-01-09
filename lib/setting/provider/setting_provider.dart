import 'package:flutter/cupertino.dart';
import 'package:flutter_drive/_constant/app_flushbar.dart';
import 'package:flutter_drive/auth/model/user_model.dart';
import 'package:flutter_drive/setting/model/complain_model.dart';
import 'package:flutter_drive/setting/repo/setting_repository.dart';

class SettingProvider extends ChangeNotifier {
  final SettingRepository _settingRepository = SettingRepository();
  final ComplainModel _complainModel = ComplainModel.empty();
  List<ComplainModel> _complainList = [];
  String _complainExplanation = "";
  int _complainAnswer = 0;
  int _complainNoAnswer = 0;

  void started() {
    _complainExplanation = "";
    notifyListeners();
  }

  Future getUserComplainList({
    required String userKey,
  }) async {
    _complainList =
        await _settingRepository.getUserComplainList(userKey: userKey);
    _complainAnswer = _complainList.where((e) => e.isAnswer).length;
    _complainNoAnswer = _complainList.where((e) => !e.isAnswer).length;
    notifyListeners();
  }

  Future sendUserComplain({
    required UserModel user,
    required bool isComplain,
    required BuildContext context,
  }) async {
    if (_complainExplanation.isNotEmpty) {
      final _category = isComplain ? "불편 사항" : "개선 사항";
      await _settingRepository.sendUserComplain(
          complain: _complainModel.copyWith(
        explanation: _complainExplanation,
        userKey: user.userKey,
        category: _category,
        email: user.email,
        createAt: DateTime.now(),
      ));
      Navigator.of(context).pop();
    } else {
      appFlushbar(message: '내용을 입력해 주세요').show(context);
    }
  }

  void getExplanationValue({
    required String value,
  }) {
    _complainExplanation = value;
    notifyListeners();
  }

  List<ComplainModel> get complainList => _complainList;
  int get complainAnswer => _complainAnswer;
  int get complainNoAnswer => _complainNoAnswer;
}
