import '../user.dart';
import 'lesson.dart';

class StudentLessons {
  final User user;
  final Lesson lesson;
  final bool viewed;
  final dynamic viewDate;

  StudentLessons(this.lesson, this.viewed, this.viewDate, this.user);
}
