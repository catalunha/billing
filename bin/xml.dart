class Teste {
  late Lote lote;

  Teste fromJson(Map<String, dynamic> json) {
    lote = (json['lote'] != null ? Lote().fromJson(json['lote']) : null)!;
    return this;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['lote'] = lote.toJson();
    return data;
  }
}

class Lote {
  late Faturas faturas;

  Lote fromJson(Map<String, dynamic> json) {
    faturas =
        (json['faturas'] != null ? Faturas().fromJson(json['faturas']) : null)!;
    return this;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['faturas'] = faturas.toJson();
    return data;
  }
}

class Faturas {
  late Fatura fatura;

  Faturas fromJson(Map<String, dynamic> json) {
    fatura =
        (json['fatura'] != null ? Fatura().fromJson(json['fatura']) : null)!;
    return this;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['fatura'] = fatura.toJson();
    return data;
  }
}

class Fatura {
  late String numero;
  late String data;
  late Atendimentos atendimentos;

  Fatura fromJson(Map<String, dynamic> json) {
    numero = json['numero'];
    data = json['data'];
    atendimentos = (json['atendimentos'] != null
        ? Atendimentos().fromJson(json['atendimentos'])
        : null)!;
    return this;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['numero'] = numero;
    data['data'] = this.data;
    data['atendimentos'] = atendimentos.toJson();
    return data;
  }
}

//N atendimento
class Atendimentos {
  late List<Atendimento> atendimento;

  Atendimentos fromJson(Map<String, dynamic> json) {
    if (json['atendimento'] != null) {
      atendimento = <Atendimento>[];
      if (json['atendimento'] is List) {
        print('atendimento é lista');
        print(json['atendimento'].length);
        json['atendimento'].forEach((v) {
          atendimento.add(Atendimento().fromJson(v));
        });
      } else {
        print('atendimento nao é lista');
        atendimento.add(Atendimento().fromJson(json['atendimento']));
      }
    }
    return this;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['atendimento'] = atendimento.map((v) => v.toJson()).toList();
    return data;
  }
}

// 1 atendimento
// class Atendimentos {
//   late Atendimento atendimento;

//   Atendimentos fromJson(Map<String, dynamic> json) {
//     if (json['atendimento'] is List) {
//       print('é lista');
//     } else {
//       print('nao é lista');
//     }
//     atendimento = (json['atendimento'] != null
//         ? Atendimento().fromJson(json['atendimento'])
//         : null)!;
//     return this;
//   }

//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['atendimento'] = atendimento.toJson();
//     return data;
//   }
// }

class Atendimento {
  late String nomePaciente;
  late String matricula;
  late String senha;
  late String dataAtendimento;
  late String tipoAtendimento;
  Null acomodacoes;
  late String totalAcomodacoes;
  late Despesas despesas;

  Atendimento fromJson(Map<String, dynamic> json) {
    nomePaciente = json['nomePaciente'];
    matricula = json['matricula'];
    senha = json['senha'];
    dataAtendimento = json['dataAtendimento'];
    tipoAtendimento = json['tipoAtendimento'];
    acomodacoes = json['acomodacoes'];
    totalAcomodacoes = json['totalAcomodacoes'];
    despesas = (json['despesas'] != null
        ? Despesas().fromJson(json['despesas'])
        : null)!;
    return this;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['nomePaciente'] = nomePaciente;
    data['matricula'] = matricula;
    data['senha'] = senha;
    data['dataAtendimento'] = dataAtendimento;
    data['tipoAtendimento'] = tipoAtendimento;
    data['acomodacoes'] = acomodacoes;
    data['totalAcomodacoes'] = totalAcomodacoes;
    data['despesas'] = despesas.toJson();
    return data;
  }
}
// 1 despesa
// class Despesas {
//   late Despesa despesa;

//   Despesas fromJson(Map<String, dynamic> json) {
//     despesa =
//         (json['despesa'] != null ? Despesa().fromJson(json['despesa']) : null)!;
//     return this;
//   }

//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['despesa'] = despesa.toJson();
//     return data;
//   }
// }
// N despesas
class Despesas {
  late List<Despesa> despesa;

  Despesas fromJson(Map<String, dynamic> json) {
    if (json['despesa'] != null) {
      // despesa = <Despesa>[];
      // json['despesa'].forEach((v) {
      //   despesa.add(Despesa.fromJson(v));
      // });

      despesa = <Despesa>[];
      if (json['despesa'] is List) {
        print('despesa é lista');
        print(json['despesa'].length);
        json['despesa'].forEach((v) {
          despesa.add(Despesa().fromJson(v));
        });
      } else {
        print('despesa nao é lista');
        despesa.add(Despesa().fromJson(json['despesa']));
      }
    }
    return this;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['despesa'] = despesa.map((v) => v.toJson()).toList();
    return data;
  }
}

class Despesa {
  late Executante executante;
  late String funcao;
  late Procedimento procedimento;
  late String quantidade;
  late String valorUnitario;
  late String valorTotal;

  Despesa fromJson(Map<String, dynamic> json) {
    executante = (json['executante'] != null
        ? Executante().fromJson(json['executante'])
        : Executante().fromJson(<String, dynamic>{}));
    if (json.containsKey('funcao')) {
      funcao = json['funcao'];
    } else {
      funcao = '';
    }

    procedimento = (json['procedimento'] != null
        ? Procedimento().fromJson(json['procedimento'])
        : null)!;
    quantidade = json['quantidade'];
    valorUnitario = json['valorUnitario'];
    valorTotal = json['valorTotal'];
    return this;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['executante'] = executante.toJson();
    data['funcao'] = funcao;
    data['procedimento'] = procedimento.toJson();
    data['quantidade'] = quantidade;
    data['valorUnitario'] = valorUnitario;
    data['valorTotal'] = valorTotal;
    return data;
  }
}

class Executante {
  late String cpf;
  late String nome;
  late String recebedor;

  Executante fromJson(Map<String, dynamic> json) {
    if (json.containsKey('cpf')) {
      cpf = json['cpf'];
    } else {
      cpf = '';
    }

    if (json.containsKey('nome')) {
      nome = json['nome'];
    } else {
      nome = '';
    }
    if (json.containsKey('recebedor')) {
      recebedor = json['recebedor'];
    } else {
      recebedor = '';
    }
    return this;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['cpf'] = cpf;
    data['nome'] = nome;
    data['recebedor'] = recebedor;
    return data;
  }
}

class Procedimento {
  late String codigo;

  Procedimento fromJson(Map<String, dynamic> json) {
    codigo = json['codigo'];
    return this;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['codigo'] = codigo;
    return data;
  }
}

// class Despesa {
//   Null executante;
//   late Procedimento procedimento;
//   late String quantidade;
//   late String valorUnitario;
//   late String valorTotal;

//   Despesa fromJson(Map<String, dynamic> json) {
//     executante = json['executante'];
//     procedimento = (json['procedimento'] != null
//         ? Procedimento().fromJson(json['procedimento'])
//         : null)!;
//     quantidade = json['quantidade'];
//     valorUnitario = json['valorUnitario'];
//     valorTotal = json['valorTotal'];
//     return this;
//   }

//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['executante'] = executante;
//     data['procedimento'] = procedimento.toJson();
//     data['quantidade'] = quantidade;
//     data['valorUnitario'] = valorUnitario;
//     data['valorTotal'] = valorTotal;
//     return data;
//   }
// }

// class Procedimento {
//   late String codigo;

//   Procedimento fromJson(Map<String, dynamic> json) {
//     codigo = json['codigo'];
//     return this;
//   }

//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['codigo'] = codigo;
//     return data;
//   }
// }
