import 'dart:convert';
import 'package:client_driver/client_driver.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class DioDriver extends DriverHttp<Response> {
  final logger = Logger();
  final Dio dio = Dio();

  DioDriver();

  @override
  Future<Response> get(
      {required String path, Map<String, dynamic>? headers}) async {
    _log(method: 'get', path: path, headers: headers);
    return await dio.get(
      path,
      options: Options(headers: headers),
    );
  }

  @override
  Future<Response> put({
    required String path,
    required Map<String, dynamic> body,
    Map<String, dynamic>? headers,
  }) async {
    _log(method: 'put', path: path, headers: headers, body: body);
    return await dio.put(
      path,
      data: body,
      options: Options(headers: headers),
    );
  }

  @override
  Future<Response> post({
    required String path,
    required Map<String, dynamic> body,
    Map<String, dynamic>? headers,
  }) async {
    _log(method: 'post', path: path, headers: headers, body: body);
    return await dio.post(
      path,
      data: body,
      options: Options(headers: headers),
    );
  }

  @override
  Future<Response> delete(
      {required String path, Map<String, dynamic>? headers}) async {
    _log(method: 'delete', path: path, headers: headers);
    return await dio.delete(
      path,
      options: Options(headers: headers),
    );
  }

  void _log({
    required String method,
    required String path,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? body,
  }) {
    logger.d(
      '=============================== INICIO ==============================\n'
      '=============== Method: $method \n'
      '=============== Path: $path \n'
      '=============== Body: ${json.encode(body)} \n'
      '=============== Headers: ${json.encode(headers)} \n'
      '============================= FIM ================================\n',
    );
  }
}
