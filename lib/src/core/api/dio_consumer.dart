import 'dart:convert';
import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:movieapp/src/core/api/status_code.dart';
import 'package:movieapp/src/core/network/error_message_model.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../error/exceptions.dart';
import '../services/services_locator.dart';
import 'api_consumer.dart';
import 'app_interceptors.dart';

class DioConsumer implements ApiConsumer {
  final Dio client;

  DioConsumer({required this.client}) {
    (client.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    client.options
    ..receiveDataWhenStatusError
     ..followRedirects = false;
     /* ..validateStatus = (status) {
        return status! < StatusCode.internalServerError;
      };*/
    client.interceptors.add(sl<AppIntercepters>());
    if (kDebugMode) {
      client.interceptors.add(sl<PrettyDioLogger>());
    }
  }

  @override
  Future get(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await client.get(path, queryParameters: queryParameters);
      if (response.statusCode == 200) {
        return response;
      }
    } on DioError catch (error) {
      /*if(error.isNoConnectionError){
        throw NoInternetConnectionException({'status_code' : 1 , 'status_message': 'no internet connection found' , 'success':false});
      }*/
      _handleDioError(error);
    }
  }

  @override
  Future post(String path,
      {Map<String, dynamic>? body,
      bool formDataIsEnabled = false,
      Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await client.post(path,
          queryParameters: queryParameters,
          data: formDataIsEnabled ? FormData.fromMap(body!) : body);
      return _handleResponseAsJson(response);
    } on DioError catch (error) {
      _handleDioError(error);
    }
  }

  @override
  Future put(String path,
      {Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
          await client.put(path, queryParameters: queryParameters, data: body);
      return _handleResponseAsJson(response);
    } on DioError catch (error) {
      return _handleDioError(error);
    }
  }

  dynamic _handleResponseAsJson(Response<dynamic> response) {
    final responseJson = jsonDecode(response.data.toString());
    return responseJson;
  }

  dynamic _handleDioError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        throw const FetchDataException();
      case DioErrorType.response:
        switch (error.response?.statusCode) {
          case StatusCode.badRequest:
            throw  BadRequestException(ErrorMessageModel.fromJson(error.response!.data));
          case StatusCode.unauthorized:
          case StatusCode.forbidden:
            throw  UnauthorizedException(ErrorMessageModel.fromJson(error.response!.data));
          case StatusCode.notFound:
            throw  NotFoundException(ErrorMessageModel.fromJson(error.response!.data));
          case StatusCode.conflict:
            throw  ConflictException(ErrorMessageModel.fromJson(error.response!.data));
          case StatusCode.internalServerError:
            throw  InternalServerErrorException(ErrorMessageModel.fromJson(error.response!.data));
        }
        break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.other :
        throw  NoInternetConnectionException(ErrorMessageModel.fromJson({'status_code' : 1 , 'status_message': 'no internet connection found' , 'success':false}));
    }
  }
}


extension DioErrorX on DioError {
  bool get isNoConnectionError =>
      type == DioErrorType.other &&
          error is SocketException; // import 'dart:io' for SocketException
}