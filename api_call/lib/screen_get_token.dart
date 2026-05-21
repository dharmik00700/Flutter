import 'package:api_call/api_service.dart';
import 'package:flutter/material.dart';

class ScreenGetToken extends StatefulWidget {
  const ScreenGetToken({super.key});

  @override
  State<ScreenGetToken> createState() => _ScreenGetTokenState();
}

class _ScreenGetTokenState extends State<ScreenGetToken> {
  dynamic data;
  bool isLoading = false;

  getdata() {
    isLoading = true;
    ApiService().gettoken().then((value) {
      setState(() {
        data = value;
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('token data'), backgroundColor: Colors.pink),
      body: Center(child: Text(data["name"].toString()),),
    );
  }
}
