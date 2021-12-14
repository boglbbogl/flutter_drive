import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';

class CourseAnimationProvider extends ChangeNotifier {
  double _yBottomPosition = size.height;
  double _yTopPosition = -size.height;
  void addressSearchBar({
    required bool value,
  }) {
    if (value == true) {
      _yBottomPosition = 0;
      _yTopPosition = 0;
      notifyListeners();
    } else {
      _yBottomPosition = size.height;
      _yTopPosition = -size.height;
      notifyListeners();
    }
  }

  double get yBottomPosition => _yBottomPosition;
  double get yTopPosition => _yTopPosition;
}
