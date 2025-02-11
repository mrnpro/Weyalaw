import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../../interceptors/dio_interceptor.dart';
import '../../../utils/index.dart';
import '../../../config/api/api_endpoints.dart';
import 'http_service.dart';

@LazySingleton(as: HttpService)
class HttpServiceImpl extends HttpService {
  late Dio _dio;

  HttpServiceImpl();

  @override
  Future<Response> deleteRequest(
      {required String urlPath,
      required Map<String, dynamic> data,
      Map<String, dynamic> queryParam = const {}}) async {
    try {
      printLog(urlPath);
      return await _dio.delete(urlPath);
    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> getRequest(
      {required String urlPath,
      Map<String, dynamic> queryParam = const {},
      Map<String, dynamic> header = const {}}) async {
    try {
      return await _dio.get(urlPath,
          queryParameters: queryParam, options: Options(headers: header));
    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> postRequest(
      {required String urlPath,
      required Map<String, dynamic> data,
      Map<String, dynamic> queryParam = const {},
      Map<String, dynamic> header = const {}}) async {
    try {
      if (kDebugMode) {
        print(data);
      }
      Response response = await _dio.post(urlPath,
          queryParameters: queryParam,
          data: data,
          options: Options(headers: header));
      return response;
    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> putRequest(
      {required String urlPath,
      required Map<String, dynamic> data,
      Map<String, dynamic> queryParam = const {}}) async {
    try {
      if (kDebugMode) {
        print(data);
      }
      Response response = await _dio.put(
        urlPath,
        queryParameters: queryParam,
        data: data,
      );
      return response;
    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> postFormDataRequest({
    required String urlPath,
    required FormData formData,
    Map<String, dynamic>? rawData,
    Map<String, dynamic> queryParam = const {},
    Map<String, dynamic> header = const {},
  }) async {
    try {
      if (kDebugMode) {
        print(formData.fields); // Print form fields for debugging if needed
      }

      Response response = await _dio.post(
        urlPath,
        data: formData,
      );
      return response;
    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  void init() {
    const timeOut = Duration(seconds: 60);
    _dio = Dio(BaseOptions(
        baseUrl: APIEndpoints.baseUrl,
        sendTimeout: timeOut,
        receiveTimeout: timeOut,
        connectTimeout: timeOut));
    final interceptors = <Interceptor>[DioInterceptor()];
    _dio.interceptors.addAll(interceptors);
  }
}
