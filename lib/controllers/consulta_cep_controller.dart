import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:test_me_poupe/db/db.dart';
import 'package:test_me_poupe/models/modeldb.dart';
import 'package:test_me_poupe/models/modelretonoviacep.dart';
import 'package:test_me_poupe/models/modelstate.dart';
import 'package:test_me_poupe/repositories/repository_via_cep.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ConsultaCepController extends ChangeNotifier {
  ModelRetornoViaCep? retorno;
  RepositoryViaCep repository = RepositoryViaCep();

  final cep = TextEditingController();
  var maskFormater = MaskTextInputFormatter(mask: '#####-###');
  modelState state = modelState.stopped;

  enviaCep() async {
    if (state == modelState.loading) return;
    try {
      state = modelState.loading;
      notifyListeners();

      retorno = await repository.postCep(cep.text.replaceAll('-', ''));

      state = modelState.sucess;
    } on DioError catch (e) {
      state = modelState.error;
    } catch (error) {
      state = modelState.error;
    } finally {
      notifyListeners();
    }
  }

  insertdb() async {}
}
