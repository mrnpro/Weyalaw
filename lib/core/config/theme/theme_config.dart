import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_find_taxi/core/utils/index.dart';

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeData>((ref) {
  return ThemeNotifier();
});

class ThemeNotifier extends StateNotifier<ThemeData> {
  ThemeNotifier() : super(_lightTheme);

  static final _lightTheme = ThemeData(
    scaffoldBackgroundColor: HexColor('#EDEDED'),
    colorScheme: ColorScheme.fromSeed(seedColor: HexColor('#0082FF')),
    brightness: Brightness.light,
  );

  static final _darkTheme = ThemeData(
    primarySwatch: Colors.indigo,
    brightness: Brightness.dark,
  );

  void toggleTheme() {
    state = state.brightness == Brightness.light ? _darkTheme : _lightTheme;
  }
}
