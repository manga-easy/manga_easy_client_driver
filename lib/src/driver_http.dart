abstract class DriverHttp<T> {
  Future<T> get({
    required String path,
    Map<String, dynamic>? headers,
  });

  Future<T> put({
    required String path,
    required Map<String, dynamic> body,
    Map<String, dynamic>? headers,
  });

  Future<T> post({
    required String path,
    required Map<String, dynamic> body,
    Map<String, dynamic>? headers,
  });

  Future<T> delete({
    required String path,
    Map<String, dynamic>? headers,
  });
}
