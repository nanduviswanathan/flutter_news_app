import 'package:dio/dio.dart';

import '../shared/constants/constants.dart';
import '../shared/helper/global_file.dart';
import '../shared/helper/logging_interceptor.dart';

class ApiRepository {
  final Dio _dio = Dio();

  ApiRepository() {
    _dio.interceptors.add(
        LoggingInterceptor(token: accessToken)); // Adding Logging Interceptor
  }

  //Get API
  Future<dynamic> get({
    String? endPoint,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(
        endPoint != null
            ? Constants.kApiBaseUrl + endPoint
            : Constants.kApiBaseUrl,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  // Post API
  Future<dynamic> post({
    String? uri,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final String finalUri = uri ?? Constants.kApiBaseUrl;
      final Response response = await _dio.post(
        finalUri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      //api_provider Dio onError function shows a toast
      if (e is DioException) {
        return {
          "error": e.response?.data["message"],
        };
      }
      return {};
    }
  }

  // Put API
  Future<dynamic> put({
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.put(
        Constants.kApiBaseUrl,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
