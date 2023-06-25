// funcion que retorna tema

import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData getTheme({colorSeed}) {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorSchemeSeed: colorSeed,
    );
  }
}
