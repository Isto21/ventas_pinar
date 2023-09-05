import 'package:flutter/material.dart';

class ThemeModel extends ChangeNotifier {
  bool? _isDarkMode = false;
  // bool? _isLigthMode = false;

  // bool? get isLigthMode => _isLigthMode;
// 
  // set isLigthMode(bool? value) {
    // _isLigthMode = value;
    // _isDarkMode = false;
    // notifyListeners();
  // }

  Color? _color = Colors.deepPurple;

  Color? get color => _color;

  set color(Color? value) {
    _color = value;
    notifyListeners();
  }

  bool? get isDarkMode => _isDarkMode;

  set isDarkMode(bool? value) {
    _isDarkMode = value;
    // _isLigthMode = false;
    notifyListeners();
  }

  Brightness currentTheme() {
    if (isDarkMode == true) return Brightness.dark;
    return Brightness.light;
  }
}
