import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class LoggingInterceptor extends Interceptor {
  final String? token;

  LoggingInterceptor({this.token});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      print('Request: ${options.method} ${options.uri}');
    }
    if (options.data != null) {
      if (kDebugMode) {
        print('Request Data: ${options.data}');
      }
    }
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      print('Response: ${response.statusCode} ${response.statusMessage}');
    }
    if (response.data != null) {
      // if (kDebugMode) {
      //   print('Response Data: ${response.data}');
      // }
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      print('Error: ${err.message}');
    }
    if (err.response != null) {
      final int statusCode = err.response!.statusCode ?? -1;
      if (statusCode >= 400 && statusCode < 500) {
        if (kDebugMode) {
          print('Client Error: ${err.response!.statusCode}');
        }
        if (kDebugMode) {
          print('Response Data: ${err.response!.data}');
        }
        // Handle client errors
      } else if (statusCode >= 500) {
        if (kDebugMode) {
          print('Server Error: ${err.response!.statusCode}');
        }
        if (kDebugMode) {
          print('Response Data: ${err.response!.data}');
        }
        // Handle server errors
      }
    }
    super.onError(err, handler);
  }
}
