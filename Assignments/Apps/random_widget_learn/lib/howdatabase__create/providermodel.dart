import 'package:flutter/cupertino.dart';

class providerexplain extends ChangeNotifier{
  int _value = 0;
  int get value => _value;

  void increment(){
    _value++;
    notifyListeners();
  }
}