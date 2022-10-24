import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:test_me_poupe/db/database.dart';
import 'package:test_me_poupe/models/modelretonoviacep.dart';
import 'package:test_me_poupe/models/modelstate.dart';
import 'package:test_me_poupe/repositories/repository_via_cep.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ConsultaCepController extends ChangeNotifier {
  ModelRetornoViaCep? retorno;
  RepositoryViaCep repository = RepositoryViaCep();
  final dbHelper = DatabaseHelper.instance;

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

  void insert() async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnLogradouro: '${retorno?.logradouro}',
      DatabaseHelper.columnCep: '${retorno?.cep}',
      DatabaseHelper.columnUf: '${retorno?.uf}',
      DatabaseHelper.columnLocalidade: '${retorno?.localidade}'
    };
    final id = await dbHelper.insert(row);
    print('insert row id: $id');
    notifyListeners();
  }

  void query() async {
    final findAll = await dbHelper.queryAllRows();
    print('query all rows');
    findAll.forEach(print);
  }

  void delete() async {
    // final id = await dbHelper.queryAllRows();
    // final rowsDeleted = await dbHelper.delete(id);
    //print('deleted $rowsDeleted row(s): row $id');
  }
}
