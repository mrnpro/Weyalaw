import 'package:dio/dio.dart';

import '../utils/index.dart';
import '../handlers/dio_error_handler.dart';

class DioInterceptor implements Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final errorMessage = DioErrorHandler.handleError(err);

    final updatedError = DioException(
      requestOptions: err.requestOptions,
      response: err.response,
      type: err.type,
      error: err.error,
      message: errorMessage,
    );

    printError('Error [${err.response?.statusCode}] => MESSAGE: $errorMessage');

    handler.next(updatedError);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }
}
