import '../user.dart';

class Lesson {
  final String courseId; //
  final String moduleId;
  final User teacher;
  final String code; // = 'a01, intro';
  final String name; // = 'aula01, introducao a ...';
  final String url;

  Lesson(this.name, this.courseId, this.moduleId, this.teacher, this.url,
      this.code);
}
