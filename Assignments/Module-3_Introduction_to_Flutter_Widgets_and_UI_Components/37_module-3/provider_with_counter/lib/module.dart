import 'package:flutter/cupertino.dart';

class countermodel extends ChangeNotifier{
  int count=0;
  int get counts => count;

  void increment(){
    count++;
    notifyListeners();
  }
  void decrement(){
    count--;
    notifyListeners();
  }
}