class CourseRepository {
  static final CourseRepository _userRepository = CourseRepository._internal();
  factory CourseRepository() => _userRepository;
  CourseRepository._internal();

  Future createCourseModel() async {}
}
