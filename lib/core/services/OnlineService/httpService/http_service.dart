import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'http_service.g.dart';

@riverpod
HttpService httpService(Ref ref) {
  throw UnimplementedError();
}

abstract class HttpService {
  void init();

  Future<Response> getRequest({
    required String urlPath,
    Map<String, dynamic> queryParam = const {},
    Map<String, dynamic> header = const {},
  });

  Future<Response> postRequest({
    required String urlPath,
    required Map<String, dynamic> data,
    Map<String, dynamic> queryParam = const {},
    Map<String, dynamic> header = const {},
  });

  Future<Response> putRequest({
    required String urlPath,
    required Map<String, dynamic> data,
    Map<String, dynamic> queryParam = const {},
  });

  Future<Response> deleteRequest({
    required String urlPath,
    required Map<String, dynamic> data,
    Map<String, dynamic> queryParam = const {},
  });

  Future<Response> postFormDataRequest({
    required String urlPath,
    required FormData formData,
    Map<String, dynamic>? rawData,
    Map<String, dynamic> queryParam = const {},
    Map<String, dynamic> header = const {},
  });
}
