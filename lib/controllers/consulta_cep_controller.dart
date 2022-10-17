import 'package:flutter/material.dart';
import 'package:test_me_poupe/models/modelretonoviacep.dart';
import 'package:test_me_poupe/repositories/repository_via_cep.dart';

class ConsultaCepController extends ChangeNotifier {
  ModelRetornoViaCep? retorno;
  RepositoryViaCep? repository;

  final cep = TextEditingController();

  enviaCep() async {
    retorno = await repository?.postCep(cep.text);
  }
}
