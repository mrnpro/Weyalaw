import 'package:flutter/material.dart';
import 'package:weyalaw/core/utils/index.dart';

void safeUiApiCall<T>(BuildContext context,
    {required Future<T> Function() apiCall,
    Function(T)? onSuccess,
    Function(String)? onError}) async {
  try {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final result = await apiCall();
      if (context.mounted) {
        onSuccess?.call(result);
      }
    });
  } catch (e) {
    printError(e);
    onError?.call(e.toString());
  }
}
