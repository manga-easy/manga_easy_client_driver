import 'dart:convert';

import 'package:client_driver/src/response_request_entity.dart';
import 'package:dio/dio.dart' as dio;
import 'package:http/http.dart' as http;

class ResponseRequestMapper {
  ResponseRequestEntity fromDio(dio.Response response) {
    return ResponseRequestEntity(
      data: response.data,
      statusCode: response.statusCode ?? 0,
      statusMessage: response.statusMessage ?? '',
    );
  }

  ResponseRequestEntity fromHttp(http.Response response) {
    return ResponseRequestEntity(
      data: _convertToMap(response.bodyBytes),
      statusCode: response.statusCode,
      statusMessage: response.reasonPhrase ?? '',
    );
  }

  Map<String, dynamic> _convertToMap(List<int> body) {
    if (body.isEmpty) {
      return {};
    }
    return json.decode(utf8.decode(body));
  }
}
