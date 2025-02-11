import 'dart:core';

import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/foundation.dart' show debugPrint;
import 'package:logger/logger.dart';
import 'package:universal_platform/universal_platform.dart';

class CustomOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    event.lines.forEach(debugPrint);
  }
}

var logger = Logger(
  printer: PrettyPrinter(
    methodCount: 2,
    errorMethodCount: 8,
    lineLength: 120,
    //colors: !UniversalPlatform.isIOS,
    printEmojis: true,
    printTime: true,
  ),
  output: CustomOutput(),
);

/// Logging config
void printLog([dynamic rawData, DateTime? startTime, Level? level]) {
  if (foundation.kDebugMode) {
    var time = '';
    if (startTime != null) {
      final endTime = DateTime.now().difference(startTime);
      final icon = endTime.inMilliseconds > 2000
          ? '⌛️Slow-'
          : endTime.inMilliseconds > 1000
              ? '⏰Medium-'
              : '⚡️Fast-';
      time = '[$icon${endTime.inMilliseconds}ms]';
    }

    try {
      final data = '$rawData';
      final log = '$time${data.toString()}';

      /// print log for ios
      if (UniversalPlatform.isIOS) {
        debugPrint(log);
        return;
      }

      /// print log for android
      switch (level) {
        case Level.error:
          printError(log, StackTrace.empty);
          break;
        case Level.warning:
          logger.w(log, stackTrace: StackTrace.empty);
          break;
        case Level.info:
          logger.i(log, stackTrace: StackTrace.empty);
          break;
        case Level.debug:
          logger.d(log, stackTrace: StackTrace.empty);
          break;
        case Level.trace:
          logger.t(log, stackTrace: StackTrace.empty);
          break;
        default:
          if (time.startsWith('[⌛️Slow-')) {
            logger.f(log, stackTrace: StackTrace.empty);
            break;
          }
          if (time.startsWith('[⏰Medium-')) {
            logger.w(log, stackTrace: StackTrace.empty);
            break;
          }
          logger.t(log, stackTrace: StackTrace.empty);
          break;
      }
    } catch (err, trace) {
      printError(err, trace);
    }
  }
}

void printError(dynamic err, [dynamic trace, dynamic message]) {
  if (!foundation.kDebugMode) {
    return;
  }

  // final shouldHide = trace == null ||
  //     '$trace'.isEmpty ||
  //     '$trace'.contains('package:gofere_travelers');
  //if (shouldHide) {
  //   logger.d(err, error: message, stackTrace: StackTrace.empty);
  //   return;
  // }

  logger.e(err, error: message ?? 'Stack trace:', stackTrace: trace);
}
