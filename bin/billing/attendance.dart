import 'expert.dart';
import 'patient.dart';
import '../provider.dart';

class Attendance {
  final Patient patientRef; //name, card
  final Expert expertRef; //name, cpf
  final Provider providerRef; //cnpj
  final String code = 'KLBN7B0'; // codigo do atendimento
  final dynamic date; // Data do atendimento
  final String billRef; //code, data
  final String type = '17'; // duvidas sobre quais tipos de atendimento
  final String function =
      '09'; // duvidas sobre quais funcoes se elas estao ligada aos procedimentos do ipsm
  final String procedureRef; //code, description
  final int quantity = 1; // depende do procedimento ?
  final int unitaryValue = 1234; // do procedimento ?
  final int totalValue = 1234; // quantity * unitaryValue

  Attendance(this.date, this.providerRef, this.patientRef, this.procedureRef,
      this.billRef, this.expertRef);
}

/*
Pac

*/
