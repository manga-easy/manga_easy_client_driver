import 'dart:convert';
import 'package:client_driver/src/cliente_request.dart';
import 'package:client_driver/src/response_request_mapper.dart';
import 'package:client_driver/src/response_request_entity.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as dev;

class ClientHttp extends ClientRequest {
  final ResponseRequestMapper _responseRequestMapper = ResponseRequestMapper();

  ClientHttp();

  @override
  Future<ResponseRequestEntity> get({
    required String path,
    Map<String, dynamic>? headers,
    Duration? sendTimeout,
    Duration? receiveTimeout,
  }) async {
    try {
      final result = await http
          .get(
            Uri.parse(path),
            headers: _validHeaders(headers),
          )
          .timeout(receiveTimeout ?? Duration(seconds: 10));
      _log(
        method: 'get',
        path: path,
        headers: headers,
        responseStatus: result.statusCode.toString(),
        responsebody: json.decode(
          result.body,
        ),
      );
      return _responseRequestMapper.fromHttp(result);
    } catch (e) {
      return ResponseRequestEntity(
        data: {},
        statusCode: 0,
        statusMessage: e.toString(),
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
      final result = await http
          .put(
            Uri.parse(path),
            headers: _validHeaders(headers),
            body: json.encode(body),
          )
          .timeout(receiveTimeout ?? Duration(seconds: 10));
      _log(
        method: 'put',
        path: path,
        headers: headers,
        body: body,
        responseStatus: result.statusCode.toString(),
        responsebody: json.decode(
          result.body,
        ),
      );
      return _responseRequestMapper.fromHttp(result);
    } catch (e) {
      return ResponseRequestEntity(
        data: {},
        statusCode: 0,
        statusMessage: e.toString(),
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
      final result = await http
          .post(
            Uri.parse(path),
            headers: _validHeaders(headers),
            body: json.encode(body),
          )
          .timeout(receiveTimeout ?? Duration(seconds: 10));
      _log(
        method: 'post',
        path: path,
        headers: headers,
        body: body,
        responseStatus: result.statusCode.toString(),
        responsebody: json.decode(
          result.body,
        ),
      );
      return _responseRequestMapper.fromHttp(result);
    } catch (e) {
      return ResponseRequestEntity(
        data: {},
        statusCode: 0,
        statusMessage: e.toString(),
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
      final result = await http
          .delete(
            Uri.parse(path),
            headers: _validHeaders(headers),
          )
          .timeout(receiveTimeout ?? Duration(seconds: 10));
      _log(
        method: 'delete',
        path: path,
        headers: headers,
        responseStatus: result.statusCode.toString(),
        responsebody: json.decode(
          result.body,
        ),
      );
      return _responseRequestMapper.fromHttp(result);
    } catch (e) {
      return ResponseRequestEntity(
        data: {},
        statusCode: 0,
        statusMessage: e.toString(),
      );
    }
  }

  void _log({
    required String method,
    required String path,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? body,
    Map<String, dynamic>? responsebody,
    required String responseStatus,
  }) {
    dev.log(
      '=============================== Request ==============================\n'
      '=============== Method: $method \n'
      '=============== Path: $path \n'
      '=============== Body: ${json.encode(body)} \n'
      '=============== Headers: ${json.encode(headers)} \n'
      '=============== ResponseBody: ${json.encode(responsebody)} \n'
      '=============== ResponseStatus: $responseStatus \n'
      '============================= FIM ================================\n',
      time: DateTime.now(),
    );
  }

  Map<String, String>? _validHeaders(Map? headers) {
    if (headers == null) {
      return null;
    }
    //TODO: Melhorar essa sobre escrita do tipo
    headers['Content-Type'] = 'application/json';
    return Map.from(headers);
  }
}
