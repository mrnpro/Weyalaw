import 'package:dio/dio.dart';

import 'dio_error_handler.dart';

class ErrorHandler {
  static String handleError(dynamic error) {
    if (error is DioException) {
      return DioErrorHandler.handleError(error);
    } else if (error is Exception) {
      return 'An unexpected error occurred';
    }
    return 'Something went wrong';
  }
}
