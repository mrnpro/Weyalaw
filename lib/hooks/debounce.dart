import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rxdart/rxdart.dart';

TextEditingController useDebouncedTextController(
    void Function(String) onDebounce) {
  final textController = useTextEditingController();

  useEffect(() {
    final behaviorSubject = BehaviorSubject<String>();
    StreamSubscription? streamSubscription;

    textController.addListener(() {
      behaviorSubject.add(textController.text);
    });

    streamSubscription = behaviorSubject
        .where((event) => event.length >= 3)
        .debounceTime(const Duration(milliseconds: 500))
        .distinct()
        .listen((event) {
      onDebounce(event);
    });

    return () {
      streamSubscription?.cancel();
      behaviorSubject.close();
    };
  }, [textController]);

  return textController;
}
