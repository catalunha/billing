import 'procedure.dart';
import '../user.dart';

class Expert {
  final User userRef;
  final String councilUF = 'MG';
  final String councilType = 'CRN';
  final String councilNumber = '4949';
  final String expertise = 'Fisioterapia';
  Map<String, Procedure> procedureMap = <String, Procedure>{};

  Expert(this.userRef); // String=uuid
}
