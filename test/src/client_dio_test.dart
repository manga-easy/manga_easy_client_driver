import 'package:client_driver/client_driver.dart';
import 'package:test/test.dart';

void main() {
  final dio = ClientDio();
  test('dio client get', () async {
    final result = await dio.get(
      path: 'http://micro-config.lucas-cm.com.br/v1/toggle/search',
    );
    expect(result.data, isNotNull);
    expect(result.statusCode, 200);
    expect(result.statusMessage, 'OK');
  });

  test('dio client get with error', () async {
    final result = await dio.get(
      path: '://micro-config.lucas-cm.com.br/v1/toggle/search',
    );
    expect(result.data, isNotNull);
    expect(result.statusCode, 0);
    expect(result.statusMessage.contains('FormatException'), isTrue);
  });

  test('dio client post', () async {
    final result = await dio.post(
      path: 'http://micro-config.lucas-cm.com.br/v1/toggle',
      body: {
        "message": {
          "message": "Online!",
        },
        "type": "User",
        "to": "556596107663",
      },
    );
    expect(result.data, isNotNull);
    expect(result.statusCode, 401);
    expect(result.statusMessage, 'Unauthorized');
  });

  test('dio client post with error', () async {
    final result = await dio.post(
      path: '://micro-config.lucas-cm.com.br/v1/toggle',
      body: {
        "message": {
          "message": "Online!",
        },
        "type": "User",
        "to": "556596107663",
      },
    );
    expect(result.data, {});
    expect(result.statusCode, 0);
    expect(result.statusMessage.contains('FormatException'), isTrue);
  });

  test('dio client put', () async {
    final result = await dio.put(
      path: 'http://micro-config.lucas-cm.com.br/v1/toggle',
      body: {
        "id": "642756e79726d612b889b793",
        "name": "isViews",
        "updateAt": 1680299751,
        "status": "ENABLE",
        "description":
            "Desativa a contagem de view no app, se false, para de consultar o endpoint de view",
        "value": false
      },
    );
    expect(result.data, isNotNull);
    expect(result.statusCode, 401);
    expect(result.statusMessage, 'Unauthorized');
  });

  test('dio client put with erro', () async {
    final result = await dio.put(
      path: '://micro-config.lucas-cm.com.br/v1/toggle',
      body: {
        "id": "642756e79726d612b889b793",
        "name": "isViews",
        "updateAt": 1680299751,
        "status": "ENABLE",
        "description":
            "Desativa a contagem de view no app, se false, para de consultar o endpoint de view",
        "value": false
      },
    );
    expect(result.data, {});
    expect(result.statusCode, 0);
    expect(result.statusMessage.contains('FormatException'), isTrue);
  });

  test('dio client delete', () async {
    final result = await dio.delete(
      path:
          'http://micro-config.lucas-cm.com.br/v1/toggle/6427458eb6f3ab4de8dcb048',
    );
    expect(result.data, isNotNull);
    expect(result.statusCode, 401);
    expect(result.statusMessage, 'Unauthorized');
  });

  test('dio client delete with erro', () async {
    final result = await dio.delete(
      path:
          '://micro-config.lucas-cm.com.br/v1/toggle/6427458eb6f3ab4de8dcb048',
    );
    expect(result.data, isNotNull);
    expect(result.statusCode, 0);
    expect(result.statusMessage.contains('FormatException'), isTrue);
  });
}
