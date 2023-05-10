import 'package:client_driver/src/response_request_entity.dart';

abstract class ClientRequest {
  Future<ResponseRequestEntity> get({
    required String path,
    Map<String, dynamic>? headers,
    Duration? sendTimeout,
    Duration? receiveTimeout,
  });

  Future<ResponseRequestEntity> put({
    required String path,
    required Map<String, dynamic> body,
    Map<String, dynamic>? headers,
    Duration? sendTimeout,
    Duration? receiveTimeout,
  });

  Future<ResponseRequestEntity> post({
    required String path,
    required Map<String, dynamic> body,
    Map<String, dynamic>? headers,
    Duration? sendTimeout,
    Duration? receiveTimeout,
  });

  Future<ResponseRequestEntity> delete({
    required String path,
    Map<String, dynamic>? headers,
    Duration? sendTimeout,
    Duration? receiveTimeout,
  });
}
