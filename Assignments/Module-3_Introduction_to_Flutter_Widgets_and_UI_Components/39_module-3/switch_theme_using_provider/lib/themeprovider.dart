import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get thememodes => _themeMode;
  bool get isdarkmode => _themeMode == ThemeMode.dark;

  void toggletheme(bool isOn){
    _themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}