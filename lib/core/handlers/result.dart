/// This file contains type definitions and utility functions for handling
/// success and failure results in a type-safe manner.
library;

import 'failure/failure.dart';
import 'success/success.dart';

/// Represents a result that can be either a success or a failure.
typedef Result<T> = ({Success<T>? success, Failure? failure});

/// Represents a future result that can be either a success or a failure.
typedef FutureResult<T> = Future<({Success<T>? success, Failure? failure})>;

/// Creates a [Result] from a given value.
///
/// If the value is a [Success], it returns a success result.
/// If the value is a [Failure], it returns a failure result.
/// For any other type, it returns a failure result with an "Unknown result type" message.
Result<T> result<T>(dynamic result) {
  if (result is Success) {
    return (success: result as Success<T>, failure: null);
  } else if (result is Failure) {
    return (success: null, failure: result);
  } else {
    return (success: null, failure: Failure(message: 'Unknown result type'));
  }
}

/// Creates a [FutureResult] from a given value.
///
/// Similar to [result], but wraps the result in a [Future].
FutureResult<T> futureResult<T>(dynamic result) {
  if (result is Success) {
    return Future.value((success: result as Success<T>, failure: null));
  } else if (result is Failure) {
    return Future.value((success: null, failure: result));
  } else {
    return Future.value(
        (success: null, failure: Failure(message: 'Unknown result type')));
  }
}

/// Extension on [Result] to provide a fold operation.
extension ResultExt<T> on ({Failure? failure, Success<T>? success}) {
  /// Applies [onSuccess] if the result is a success, or [onFailure] if it's a failure.
  ///
  /// Throws an exception if the result is neither success nor failure.
  R fold<R>({
    required R Function(Success<T>) onSuccess,
    required R Function(Failure) onFailure,
  }) {
    final res = this;
    if (res.success != null) {
      return onSuccess(res.success!);
    } else if (res.failure != null) {
      return onFailure(res.failure!);
    }
    return onFailure(Failure(message: 'Result is neither success nor failure'));
  }
}

Result<String> test() {
  try {
    return Success.send(data: 'Test success');
  } catch (e) {
    return Failure.send(error: e);
  }
}

void main(List<String> args) {
  final res = test();
  if (res.failure != null) {
    print('Failure: ${res.failure!.message}');
  } else {
    print('Success: ${res.success!.data}');
  }
}
