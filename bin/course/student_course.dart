import '../user.dart';
import 'course.dart';

class StudentCourses {
  final User user;
  final Course courseRef;
  final bool active;

  StudentCourses(this.courseRef, this.user, this.active);
}
