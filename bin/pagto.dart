class Billing {
  String numero;
  String data;
  Map<String, BillingExecutante> billExecutante = <String, BillingExecutante>{};
  Billing({
    required this.numero,
    required this.data,
  });
}

class BillingExecutante {
  String cpf;
  String nome;
  Map<String, BillingPaciente> paciente = <String, BillingPaciente>{};
  BillingExecutante({
    required this.cpf,
    required this.nome,
  });
}

class BillingPaciente {
  String nome;
  String matricula;
  String senha;
  String valorTotal;
  BillingPaciente({
    required this.nome,
    required this.matricula,
    required this.senha,
    required this.valorTotal,
  });
}
