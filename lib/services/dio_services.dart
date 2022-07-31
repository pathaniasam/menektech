import 'package:dio/dio.dart';
import 'package:manek/services/network_utils.dart';

class ApiHelper {
  static CancelToken? cancelToken;

  static Dio createDio() {
    cancelToken = CancelToken();
    return Dio(BaseOptions(
      connectTimeout: 500000,
      receiveTimeout: 100000,
      baseUrl: NetworkUtils.BASE_URL,
    ));
  }
}

class MyException {
  int statusCode;
  String message;

  MyException(this.statusCode, this.message);
}
