import 'package:flutter/material.dart';
import 'package:go_find_taxi/core/utils/index.dart';

class NavigatorObserverAnalytics extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    printLog('did push route');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    printLog('did pop');
  }
}
