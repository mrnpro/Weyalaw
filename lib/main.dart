import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weyalaw/core/services/index.dart';

import 'app.dart';
import 'core/analytics/observers/riverpod_loger.dart';
import 'core/services/OnlineService/httpService/http_service_impl.dart';
import 'core/services/localService/local_service_impl.dart';
import 'core/utils/index.dart';

late ProviderContainer container;
void main() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await dotenv.load(fileName: ".env");
    final httpImpl = HttpServiceImpl();
    final localServiceImplementation = HiveLocalStorageService();
    await localServiceImplementation.init();
    container = ProviderContainer(
      observers: [RiverpodLogger()],
      overrides: [
        httpServiceProvider.overrideWith(
          (ref) => httpImpl..init(),
        ),
        localStorageServiceProvider
            .overrideWith((ref) => localServiceImplementation),
      ],
    );

    FlutterError.onError = (FlutterErrorDetails details) async {
      printLog(
          "--------------------------------- Sending to crash analytics ----------------------");
      // await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);

      // await FirebaseCrashlytics.instance
      //     .recordFlutterError(details, fatal: true);
      printLog("--------------------------- sent ---------------------------");
    };
    runApp(UncontrolledProviderScope(container: container, child: const App()));
  }, (error, stack) {
    printError(error);
  });
}
