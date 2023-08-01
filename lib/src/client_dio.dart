import 'dart:convert';
import 'package:client_driver/src/cliente_request.dart';
import 'package:client_driver/src/response_request_mapper.dart';
import 'package:dio/dio.dart';
import 'package:client_driver/src/response_request_entity.dart';
import 'dart:developer' as dev;

class ClientDio extends ClientRequest {
  final ResponseRequestMapper _responseRequestMapper = ResponseRequestMapper();
  final Dio _dio = Dio();

  ClientDio();

  @override
  Future<ResponseRequestEntity> get({
    required String path,
    Map<String, dynamic>? headers,
    Duration? sendTimeout,
    Duration? receiveTimeout,
  }) async {
    try {
      _log(method: 'get', path: path, headers: headers);
      final result = await _dio.get(
        path,
        options: Options(
          headers: headers,
          sendTimeout: sendTimeout,
          receiveTimeout: receiveTimeout,
        ),
      );

      return _responseRequestMapper.fromDio(result);
    } on DioException catch (e) {
      return ResponseRequestEntity(
        data: e.response?.data ?? {},
        statusCode: e.response?.statusCode ?? 0,
        statusMessage:
            e.response?.statusMessage ?? e.message ?? e.error.toString(),
      );
    }
  }

  @override
  Future<ResponseRequestEntity> put({
    required String path,
    required Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    Duration? sendTimeout,
    Duration? receiveTimeout,
  }) async {
    try {
      _log(method: 'put', path: path, headers: headers, body: body);

      final result = await _dio.put(
        path,
        data: body,
        options: Options(
          headers: headers,
          sendTimeout: sendTimeout,
          receiveTimeout: receiveTimeout,
        ),
      );
      return _responseRequestMapper.fromDio(result);
    } on DioException catch (e) {
      return ResponseRequestEntity(
        data: e.response?.data ?? {},
        statusCode: e.response?.statusCode ?? 0,
        statusMessage:
            e.response?.statusMessage ?? e.message ?? e.error.toString(),
      );
    }
  }

  @override
  Future<ResponseRequestEntity> post({
    required String path,
    required Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    Duration? sendTimeout,
    Duration? receiveTimeout,
  }) async {
    try {
      _log(method: 'post', path: path, headers: headers, body: body);
      final result = await _dio.post(
        path,
        data: body,
        options: Options(
          headers: headers,
          sendTimeout: sendTimeout,
          receiveTimeout: receiveTimeout,
        ),
      );

      return _responseRequestMapper.fromDio(result);
    } on DioException catch (e) {
      return ResponseRequestEntity(
        data: e.response?.data ?? {},
        statusCode: e.response?.statusCode ?? 0,
        statusMessage:
            e.response?.statusMessage ?? e.message ?? e.error.toString(),
      );
    }
  }

  @override
  Future<ResponseRequestEntity> delete({
    required String path,
    Map<String, dynamic>? headers,
    Duration? sendTimeout,
    Duration? receiveTimeout,
  }) async {
    try {
      _log(method: 'delete', path: path, headers: headers);
      final result = await _dio.delete(
        path,
        options: Options(
          headers: headers,
          sendTimeout: sendTimeout,
          receiveTimeout: receiveTimeout,
        ),
      );

      return _responseRequestMapper.fromDio(result);
    } on DioException catch (e) {
      return ResponseRequestEntity(
        data: e.response?.data ?? {},
        statusCode: e.response?.statusCode ?? 0,
        statusMessage:
            e.response?.statusMessage ?? e.message ?? e.error.toString(),
      );
    }
  }

  void _log({
    required String method,
    required String path,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? body,
  }) {
    dev.log(
      '=============================== INICIO ==============================\n'
      '=============== Method: $method \n'
      '=============== Path: $path \n'
      '=============== Body: ${json.encode(body)} \n'
      '=============== Headers: ${json.encode(headers)} \n'
      '============================= FIM ================================\n',
      time: DateTime.now(),
    );
  }
}
