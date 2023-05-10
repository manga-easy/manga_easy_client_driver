import 'package:client_driver/src/response_request_entity.dart';
import 'package:dio/dio.dart' as dio;

class ResponseRequestMapper {
  ResponseRequestEntity fromDio(dio.Response response) {
    return ResponseRequestEntity(
      data: response.data,
      statusCode: response.statusCode ?? 0,
      statusMessage: response.statusMessage ?? '',
    );
  }
}
