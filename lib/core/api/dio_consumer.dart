import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:tmda/core/api/api_consumer.dart';
import 'package:tmda/core/api/api_status_code.dart';
import 'package:tmda/core/api/dio_interceptor.dart';
import 'package:tmda/core/api/dio_logger.dart';
import 'package:tmda/core/constants/api_constants.dart';
import 'package:tmda/core/error/exception.dart';
import 'package:tmda/injection_container.dart';

class DioApiConsumer extends ApiConsumer {
  final Dio dioClient;
  DioApiConsumer({required this.dioClient}) {
    // Fix for dio handshake error
    (dioClient.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      final dioClient = HttpClient();
      dioClient.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return dioClient;
    };
    // dio validation
    dioClient.options
      ..baseUrl = ApiConstants.baseUrl
      ..responseType = ResponseType.plain
      ..queryParameters = {ApiConstants.apiKeyQuery: ApiConstants.apiKey}
      ..followRedirects = false
      ..validateStatus = (status) {
        return status! < ApiStatusCodes.internalServerError;
      };

    dioClient.interceptors.add(
      getIt<DioInterceptor>(),
    );

    if (kDebugMode) {
      dioClient.interceptors.add(getIt<DioLogInterceptor>());
    }
  }

  @override
  Future get(String endPointPath,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final Response response =
          await dioClient.get(endPointPath, queryParameters: queryParameters);
      return _handleResponseAsJson(response);
    } on DioException catch (error) {
      _handelDioError(error);
    }
  }

  @override
  Future post(String endPointPath,
      {Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters}) async {
    try {
      final Response response = await dioClient.post(endPointPath,
          queryParameters: queryParameters, data: body);
      return _handleResponseAsJson(response);
    } on DioException catch (error) {
      _handelDioError(error);
    }
  }

  @override
  Future put(String endPointPath,
      {Map<String, dynamic>? body,
      bool formDataIsEnabled = false,
      Map<String, dynamic>? queryParameters}) async {
    try {
      final Response response = await dioClient.put(endPointPath,
          queryParameters: queryParameters,
          data: formDataIsEnabled ? FormData.fromMap(body!) : body);
      return _handleResponseAsJson(response);
    } on DioException catch (error) {
      _handelDioError(error);
    }
  }

  @override
  Future delete(String endPointPath,
      {Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters}) async {
    try {
      final Response response = await dioClient.delete(endPointPath,
          queryParameters: queryParameters, data: body);
      return _handleResponseAsJson(response);
    } on DioException catch (error) {
      _handelDioError(error);
    }
  }

  dynamic _handleResponseAsJson(Response<dynamic> response) {
    final responseJson = jsonDecode(response.data.toString());
    return responseJson;
  }

  dynamic _handelDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        throw const NoInternetConnectionException();
      case DioExceptionType.connectionError:
        throw const NoInternetConnectionException();
      case DioExceptionType.sendTimeout:
        throw const NoInternetConnectionException();
      case DioExceptionType.receiveTimeout:
        throw const FetchDataException();
      case DioExceptionType.badResponse:
        switch (error.response?.statusCode) {
          case ApiStatusCodes.badRequest:
            throw const BadRequestException();
          case ApiStatusCodes.unauthorized:
          case ApiStatusCodes.forbidden:
            throw const UnauthorizedException();
          case ApiStatusCodes.notFound:
            throw const NotFoundException();
          case ApiStatusCodes.conflict:
            throw const ConflictException();
          case ApiStatusCodes.internalServerError:
            throw const InternalServerErrorException();
        }
        break;
      case DioExceptionType.badCertificate:
        break;
      case DioExceptionType.cancel:
        break;
      case DioExceptionType.unknown:
        throw const NoInternetConnectionException();
    }
  }
}
