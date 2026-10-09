import 'package:flutter/material.dart';

import '../models/endereco_model.dart';

class CepController extends ChangeNotifier {
  final TextEditingController cepTextController = TextEditingController();

  // Dados mockados iniciais
  EnderecoModel? endereco = EnderecoModel.fromJson({
    "cep": "01001-000",
    "logradouro": "Praça da Sé",
    "complemento": "lado ímpar",
    "unidade": "",
    "bairro": "Sé",
    "localidade": "São Paulo",
    "uf": "SP",
    "estado": "São Paulo",
    "regiao": "Sudeste",
    "ibge": "3550308",
    "gia": "1004",
    "ddd": "11",
    "siafi": "7107",
  });

  void buscaCep() {}

  @override
  void dispose() {
    cepTextController.dispose();
    super.dispose();
  }
}
