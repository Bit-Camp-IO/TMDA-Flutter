import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/constants/api_constants.dart';
import 'package:tmda/features/shared/domain/usecases/get_session_id_usecase.dart';

@lazySingleton
class AuthenticatedInterceptor extends Interceptor{
  final GetSessionIdUseCase _getSessionIdUseCase;

  const AuthenticatedInterceptor(this._getSessionIdUseCase);
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async{
    options.queryParameters['session_id'] = await _getSessionIdUseCase();
    if (kDebugMode) {
      print('REQUEST[${options.method}] => PATH: ${options.path}');
    }
    options.headers[ApiConstants.headerContentType] = ApiConstants.headerContentTypeValue;
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      print('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      print('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    }
    super.onError(err, handler);
  }
}