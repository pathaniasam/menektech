import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:manek/services/network_utils.dart';

import 'network_services.dart';

class NetworkCall extends INetworkService {
  NetworkCall({
    required Dio client,
  }) : _client = client;

  final Dio _client;

  @override
  Future<Response?> get(String subUrl,
      {Map<String, dynamic>? params,
      String? authtoken,
      bool addBaseUrl = true}) async {
    _client.options.headers["Accept"] = "application/json";

    _client.options.headers["Content-Type"] = "application/json";
    try {
      print(NetworkUtils.BASE_URL + subUrl);
      final response = await _client.get<String>(
        addBaseUrl ? NetworkUtils.BASE_URL + subUrl : subUrl,
        queryParameters: params,
      );
      print("--- header:" + json.encode(_client.options.headers));
      print(response);
      return response;
    } on DioError catch (e) {
      if (e.response != null) {
        print("StatusCode....yy" + e.response!.statusCode.toString());
        print("StatusCodez....yy" + e.response!.toString());
        return e.response;
      } else {
        print(e.message);
        print("Error 408");

        return e.response;
      }
    }
  }

  @override
  Future<Response?> post(String subUrl,
      {Map? body, FormData? formData, String? authtoken}) async {
    if (body != null) body.removeWhere((k, v) => v == null);

    Response response;
    try {
      response = await _client.post<String>(
        NetworkUtils.BASE_URL + subUrl,
        data: body != null
            ? json.encode(body)
            : formData != null
                ? formData
                : null,
      );
      log(response.data);
      return response;
    } on DioError catch (e) {
      if (e.response != null) {
        print("StatusCode....yy" + e.response!.statusCode.toString());
        print("StatusCodez....yy" + e.response!.toString());
        return e.response;
      } else {
        return e.response;
      }
    }
  }
}
