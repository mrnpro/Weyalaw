import 'package:go_find_taxi/core/handlers/error_handler.dart';

import '../result.dart';

class Failure {
  final String? message;
  final String? stackTrace;

  Failure({required this.message, this.stackTrace});

  static Result<T> send<T>({required Object error}) {
    final message = ErrorHandler.handleError(error);
    return result<T>(Failure(message: message));
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Failure &&
        other.message == message &&
        other.stackTrace == stackTrace;
  }

  @override
  int get hashCode => message.hashCode ^ stackTrace.hashCode;
}
