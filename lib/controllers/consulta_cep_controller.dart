import 'package:flutter/material.dart';
import 'package:test_me_poupe/models/modelretonoviacep.dart';
import 'package:test_me_poupe/repositories/repository_via_cep.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ConsultaCepController extends ChangeNotifier {
  ModelRetornoViaCep? retorno;
  RepositoryViaCep repository = RepositoryViaCep();

  final cep = TextEditingController();
  var maskFormater = MaskTextInputFormatter(mask: '#####-###');

  enviaCep() async {
    retorno = await repository.postCep(cep.text);
  }
}
