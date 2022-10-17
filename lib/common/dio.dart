import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:test_me_poupe/common/const.dart';

final options = BaseOptions(
  baseUrl: baseUrl,
  validateStatus: (value) {
    return value! < 300;
  },
);

Dio dio = Dio(options)
  ..interceptors.add(
    PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
      error: true,
    ),
  );
