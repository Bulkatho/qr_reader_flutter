import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  bool _sliderEnabled = true;

  bool get sliderEnabled {
    return _sliderEnabled;
  }

  set sliderEnabled(bool i){
    _sliderEnabled = i;
    notifyListeners();
  }
}