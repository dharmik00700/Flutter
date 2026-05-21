import 'package:flutter/material.dart';

class SnackbarWidget extends StatefulWidget {
  const SnackbarWidget({super.key});

  @override
  State<SnackbarWidget> createState() => _SnackbarWidgetState();
}

class _SnackbarWidgetState extends State<SnackbarWidget> {
  void showsnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('hello'),
        backgroundColor: Colors.yellowAccent,
        behavior: SnackBarBehavior.fixed,
        action: SnackBarAction(label: 'undo', onPressed: () {}),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Snack Bar Widget', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: ElevatedButton(onPressed: showsnackbar, child: Text('SnackBar Show'))),
        ],
      ),
    );
  }
}
