import 'package:flutter/material.dart';

class AppTheme {
  ThemeData appTheme() {
    return ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          ),
        colorSchemeSeed: Colors.deepPurple
            );
  }
}
