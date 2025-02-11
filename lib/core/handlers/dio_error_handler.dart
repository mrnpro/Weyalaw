import 'package:dio/dio.dart';

class DioErrorHandler {
  static String handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.sendTimeout:
        return 'Send request timed out. Please try again.';
      case DioExceptionType.receiveTimeout:
        return 'Receive timed out. Please try again.';
      case DioExceptionType.badResponse:
        return _handleResponseError(error.response);
      case DioExceptionType.cancel:
        return 'Request to the server was cancelled.';
      case DioExceptionType.unknown:
        return 'Something went wrong. Please check your connection.';
      case DioExceptionType.connectionError:
        return 'Something went wrong. Please check your connection.';

      default:
        return 'An unexpected error occurred.';
    }
  }

  static String _handleResponseError(Response? response) {
    if (response == null) {
      return 'No response from the server. Please try again.';
    }

    switch (response.statusCode) {
      case 400:
        return 'Bad request.';
      case 401:
        return 'Unauthorized. Please check your credentials.';
      case 403:
        return 'Access forbidden. You do not have permission.';
      case 404:
        return 'Resource not found. Please try again.';
      case 500:
        return 'Internal server error. Please try later.';
      case 503:
        return 'Service unavailable. Please try later.';
      default:
        return 'Received an unexpected error: ${response.statusCode}.';
    }
  }
}
