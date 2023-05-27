abstract class ApiConsumer {
  Future<dynamic> get(
    String endPointPath, {
    Map<String, dynamic>? queryParameters,
  });
  Future<dynamic> post(
    String endPointPath, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
  });
  Future<dynamic> put(
    String endPointPath, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
  });
  Future<dynamic> delete(
    String endPointPath, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
  });
}
