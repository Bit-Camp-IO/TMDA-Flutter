import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/constants/api_constants.dart';
import 'package:tmda/features/shared/data/datasources/local_data_source.dart';
import 'package:tmda/injection_container.dart';

@lazySingleton
class DioInterceptor extends Interceptor {
  String _sessionId = '';

  /// List of URLs that should not include `session_id`
  final List<String> _exemptedUrls = [
    ApiConstants.validateWithLoginEndPoint,
    ApiConstants.requestTokenEndpoint,
    ApiConstants.newSessionEndpoint,
  ];

  DioInterceptor();

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (kDebugMode) {
      print('REQUEST[${options.method}] => PATH: ${options.path}');
    }

    options.headers[ApiConstants.headerContentType] =
        ApiConstants.headerContentTypeValue;

    final isExempted = _exemptedUrls.any((url) => options.path.contains(url));
    if (!isExempted) {
      if (_sessionId.isEmpty) {
        _sessionId = await getIt<LocalDataSource>().getSessionId();
      }
      options.queryParameters['session_id'] = _sessionId;
    }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      print(
          'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      print(
          'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    }
    super.onError(err, handler);
  }
}
