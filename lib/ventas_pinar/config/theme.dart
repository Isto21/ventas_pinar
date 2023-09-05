import 'package:flutter/material.dart';

class AppTheme {

  ThemeData appTheme({Color? color, Brightness? brightness}) {
    return ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          ),
        colorSchemeSeed: (color==null) ? Colors.deepPurple : color ,
        useMaterial3: true,
        brightness: brightness
            );
  }

 
}

