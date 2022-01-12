import 'package:flutter/cupertino.dart';
import 'package:flutter_drive/recommendation/recommendation_model.dart';
import 'package:flutter_drive/recommendation/recommendation_repository.dart';

class RecommendationProvider extends ChangeNotifier {
  final RecommendationRepository _recommendationRepository =
      RecommendationRepository();
  List<RouteCourseModel> _routeCourseList = [];
  bool _isLike = false;

  RecommendationProvider() {
    _getRouteCourseList();
  }

  Future _getRouteCourseList() async {
    _routeCourseList = await _recommendationRepository.getRouteCourseList();
    notifyListeners();
  }

  Future<void> routeCourseLike() async {
    _isLike = true;
    notifyListeners();
    await Future.delayed(
      const Duration(milliseconds: 500),
      () => _isLike = false,
    );
    notifyListeners();
  }

  List<RouteCourseModel> get routeCourseList => _routeCourseList;
  bool get isLike => _isLike;
}
