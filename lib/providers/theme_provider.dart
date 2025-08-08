import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode mode = ThemeMode.light;


  changeMode(ThemeMode mode){
    this.mode = mode;
    notifyListeners();
  }
  void toggleTheme(bool isDark) {
    mode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}