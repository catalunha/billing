import 'dart:convert';
import 'dart:io';
import 'pagto.dart';
import 'xml.dart';

/*
KKKFD10
KLNFD10
KTGFD10
OU
KLNFD10
KTGFD10
KKKFD10
1) por faturamento cada profissional lista seus pacientes
2) por faturamento cada profissional lista seus pacientes e o valor
3) por fatura vamor de cada paciente
*/

void main(List<String> arguments) {
  // conferirXML();
  // analisePagtoMarkdown();
  analisePagtoCSV();
}

void analisePagtoCSV() async {
  // var file = 'K3AAD10';
  // var file = 'KKKFD10a';
  var file = 'KLNFD10a';
  // var file = 'KTGFD10a';
  var path = '/home/catalunha/gdrive/iza/Fatura/FaturaBH';
  print('$path/$file.json');
  late Billing billing;
  await File('$path/$file.json').readAsString().then((String contents) async {
    var jsonData = jsonDecode(contents);
    var teste = Teste().fromJson(jsonData);
    billing = Billing(
      numero: teste.lote.faturas.fatura.numero,
      data: teste.lote.faturas.fatura.data,
    );
    teste.lote.faturas.fatura.atendimentos.atendimento.forEach((atendimento) {
      atendimento.despesas.despesa.forEach((despesa) {
        if (!billing.billExecutante.containsKey(despesa.executante.cpf)) {
          billing.billExecutante.addAll({
            despesa.executante.cpf: BillingExecutante(
              cpf: despesa.executante.cpf,
              nome: despesa.executante.nome,
            )
          });
        }
        billing.billExecutante[despesa.executante.cpf]!.paciente.addAll({
          atendimento.matricula: BillingPaciente(
            nome: atendimento.nomePaciente,
            matricula: atendimento.matricula,
            senha: atendimento.senha,
            valorTotal: despesa.valorTotal,
          )
        });

        // }
      });
    });
  });

  print(billing.numero);
  print(billing.data);
  var rel = '';
  rel += 'Fatura: ${billing.numero}\n';
  rel += 'Data da Fatura: ${billing.data}\n\n';
  rel += 'Executante,Paciente,Senha,ValorTotal,\n';
  rel += '---,---,---,---\n';
  billing.billExecutante.forEach((key, value) {
    // print(key);
    // print(value.cpf);
    rel += '${value.nome} CPF: ${value.cpf},,,\n';
    var soma = 0;
    value.paciente.forEach((key, value) {
      // print(key);
      rel +=
          ',${value.nome} CPF: ${value.matricula},${value.senha},${value.valorTotal}\n';
      soma += int.parse(value.valorTotal.replaceAll('.', ''));
      // print(value.matricula);
      // print(value.senha);
      // print(value.valorTotal);
    });
    rel += '${value.nome} CPF: ${value.cpf},,,${soma / 100}\n';
  });

  await File('docs/$file.csv')
      .writeAsString(rel)
      .then((value) => print('Convert finalized'));
}

void analisePagtoMarkdown() async {
  var file = 'K3AAD10';
  // var file = 'KKKFD10a';
  // var file = 'KLNFD10a';
  // var file = 'KTGFD10a';
  var path = '/home/catalunha/gdrive/iza/Fatura/FaturaBH';
  print('$path/$file.json');
  late Billing billing;
  await File('$path/$file.json').readAsString().then((String contents) async {
    var jsonData = jsonDecode(contents);
    var teste = Teste().fromJson(jsonData);
    // print(teste.lote);
    // print(teste.lote.faturas);
    // print(teste.lote.faturas.fatura);
    // print(teste.lote.faturas.fatura.numero);
    // print(teste.lote.faturas.fatura.data);
    billing = Billing(
      numero: teste.lote.faturas.fatura.numero,
      data: teste.lote.faturas.fatura.data,
    );
    // print(teste.lote.faturas.fatura.atendimentos);
    // print(teste.lote.faturas.fatura.atendimentos.atendimento.length);
    teste.lote.faturas.fatura.atendimentos.atendimento.forEach((atendimento) {
      // print(atendimento.nomePaciente);
      // print(atendimento.matricula);
      // print(atendimento.senha);
      // print(atendimento.dataAtendimento);
      // print(atendimento.tipoAtendimento);
      // print(atendimento.acomodacoes);
      // print(atendimento.totalAcomodacoes);
      // print(atendimento.despesas);
      // print(atendimento.despesas.despesa.length);
      atendimento.despesas.despesa.forEach((despesa) {
        // print(despesa.executante.cpf);
        // print(despesa.executante.nome);
        // print(despesa.executante.recebedor);
        // print(despesa.funcao);
        // print(despesa.procedimento.codigo);
        // print(despesa.quantidade);
        // print(despesa.valorUnitario);
        // print(despesa.valorTotal);
        if (!billing.billExecutante.containsKey(despesa.executante.cpf)) {
          billing.billExecutante.addAll({
            despesa.executante.cpf: BillingExecutante(
              cpf: despesa.executante.cpf,
              nome: despesa.executante.nome,
            )
          });
        }
        // if (!billing.billExecutante[despesa.executante.cpf]!.paciente
        //     .containsKey(atendimento.matricula)) {
        billing.billExecutante[despesa.executante.cpf]!.paciente.addAll({
          atendimento.matricula: BillingPaciente(
            nome: atendimento.nomePaciente,
            matricula: atendimento.matricula,
            senha: atendimento.senha,
            valorTotal: despesa.valorTotal,
          )
        });

        // }
      });
    });
  });

  print(billing.numero);
  print(billing.data);
  var rel = '';
  rel += '# Fatura: ${billing.numero}\n';
  rel += 'Data da Fatura: ${billing.data}\n\n';
  rel += 'Executante|Paciente|Senha|ValorTotal|\n';
  rel += '---|---|---|---\n';
  billing.billExecutante.forEach((key, value) {
    // print(key);
    // print(value.cpf);
    rel += '${value.nome}, CPF: ${value.cpf}|||\n';
    var soma = 0;
    value.paciente.forEach((key, value) {
      // print(key);
      rel +=
          '|${value.nome}, CPF: ${value.matricula}|${value.senha}|${value.valorTotal}\n';
      soma += int.parse(value.valorTotal.replaceAll('.', ''));
      // print(value.matricula);
      // print(value.senha);
      // print(value.valorTotal);
    });
    rel += '${value.nome}, CPF: ${value.cpf}|||${soma / 100}\n';
  });

  await File('docs/$file.md')
      .writeAsString(rel)
      .then((value) => print('Convert finalized'));
}

void conferirXML() {
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
      // print(teste.lote);
      // print(teste.lote.faturas);
      // print(teste.lote.faturas.fatura);
      // print(teste.lote.faturas.fatura.numero);
      // print(teste.lote.faturas.fatura.data);
      // print(teste.lote.faturas.fatura.atendimentos);
      // print(teste.lote.faturas.fatura.atendimentos.atendimento.length);
      teste.lote.faturas.fatura.atendimentos.atendimento.forEach((atendimento) {
        // print(atendimento.nomePaciente);
        // print(atendimento.matricula);
        // print(atendimento.senha);
        // print(atendimento.dataAtendimento);
        // print(atendimento.tipoAtendimento);
        // print(atendimento.acomodacoes);
        // print(atendimento.totalAcomodacoes);
        // print(atendimento.despesas);
        // print(atendimento.despesas.despesa.length);
        atendimento.despesas.despesa.forEach((despesa) {
          // print(despesa.executante.cpf);
          print(despesa.executante.nome);
          // print(despesa.executante.recebedor);
          // print(despesa.funcao);
          // print(despesa.procedimento.codigo);
          // print(despesa.quantidade);
          // print(despesa.valorUnitario);
          // print(despesa.valorTotal);
        });
      });
    });
  });
}
