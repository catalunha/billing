import 'dart:convert';
import 'dart:io';
import 'xml.dart';

void main(List<String> arguments) {
  // Create a client transformer
  // var file = 'K9QFD10'; // 1 atendimentos
  // var file = 'K9PFD10'; // N atendimentos
  // var file = 'K4TBD10'; // "executante": null,
  var fileList = [
    'K3AAD10',
    'K9QFD10',
    'KC9AD10',
    'KJ9AD10',
    'KPQFD10',
    'K4TBD10',
    'KA7LB10',
    'KD7LB10',
    'KKKFD10',
    'KT9AD10',
    'K59AD10',
    'KAAAD10',
    'KE7LB10',
    'KKQFD10',
    'KYPFD10',
    'K6AAD10',
    'KB7LB10',
    'KG9AD10',
    'KLNFD10',
    'KZ9AD10',
    'K9PFD10',
    'KC7LB10',
    'KJ8LB10',
    'KP8LB10'
  ];
  fileList.forEach((element) {
    var file = element;
    var path = '/home/catalunha/gdrive/iza/Fatura/FaturaBH';
    print('$path/$file.json');
    File('$path/$file.json').readAsString().then((String contents) async {
      var jsonData = jsonDecode(contents);
      var teste = Teste().fromJson(jsonData);
      print(teste.lote);
      print(teste.lote.faturas);
      print(teste.lote.faturas.fatura);
      print(teste.lote.faturas.fatura.numero);
      print(teste.lote.faturas.fatura.data);
      print(teste.lote.faturas.fatura.atendimentos);
      print(teste.lote.faturas.fatura.atendimentos.atendimento.length);
      teste.lote.faturas.fatura.atendimentos.atendimento.forEach((atendimento) {
        print(atendimento.nomePaciente);
        print(atendimento.matricula);
        print(atendimento.senha);
        print(atendimento.dataAtendimento);
        print(atendimento.tipoAtendimento);
        print(atendimento.acomodacoes);
        print(atendimento.totalAcomodacoes);
        print(atendimento.despesas);
        print(atendimento.despesas.despesa.length);
        atendimento.despesas.despesa.forEach((despesa) {
          print(despesa.executante.cpf);
          print(despesa.executante.nome);
          print(despesa.executante.recebedor);
          print(despesa.funcao);
          print(despesa.procedimento.codigo);
          print(despesa.quantidade);
          print(despesa.valorUnitario);
          print(despesa.valorTotal);
        });
      });
    });
  });
  // Parse a simple XML string
}
