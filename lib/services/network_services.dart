import 'package:dio/dio.dart';

abstract class INetworkService<T> {
  Future<T> post(
    String subUrl, {
    Map? body,
    FormData? formData,
    String? authtoken,
  });

  Future<T> get(String subUrl,
      {Map<String, dynamic>? params,
      String? authtoken,
      bool addBaseUrl = true});
}
