import 'package:dio/dio.dart';
import 'package:test_me_poupe/common/const.dart';
import 'package:test_me_poupe/common/dio.dart';
import 'package:test_me_poupe/models/modelretonoviacep.dart';

class RepositoryViaCep {
  Future<ModelRetornoViaCep?> postCep(String cep) async {
    try {
      Response response = await dio.post(
        baseUrl + cep + varJson,
        options: Options(
          contentType: 'application/json',
          responseType: ResponseType.json,
        ),
      );
      if (response.statusCode == 200) {
        var saida = ModelRetornoViaCep.fromJson(response.data);
        return saida;
      }
      return null;
    } on DioError catch (exc) {
      throw ('Exception ${exc.message}');
    }
  }
}
