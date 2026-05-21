import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ErrorToast {
  void errorhandle(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$message', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.teal,
      ),
    );
  }
}
