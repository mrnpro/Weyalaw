import 'package:flutter/material.dart';

import '../../../core/utils/src/print_util.dart';

class ErrorScreen extends StatelessWidget {
  final Exception? error;

  const ErrorScreen(this.error, {super.key});

  @override
  Widget build(BuildContext context) {
    printLog("ErrorScreen: ${error?.toString()}");
    return const Scaffold(
      body: Center(
        child: Text(
          '404',
          style: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
