import '../provider.dart';

class Course {
  final Provider providerRef;
  final String code; // = 'acp / engamb';
  final String name; // = 'Acumputura / Eng Amb';
  final String team; // = 'turma 2021-1 / calouros 2021-1';
  final bool arquived;
  final List<String> moduleList; // uuid dos modulos;

  Course(this.providerRef, this.moduleList, this.code, this.name, this.team,
      this.arquived);
}
