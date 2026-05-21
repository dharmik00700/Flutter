import 'package:api_call/api_service.dart';
import 'package:flutter/material.dart';

class ScreenWithoutModel extends StatefulWidget {
  const ScreenWithoutModel({super.key});

  @override
  State<ScreenWithoutModel> createState() => _ScreenWithoutModelState();
}

class _ScreenWithoutModelState extends State<ScreenWithoutModel> {
  dynamic singlepost;
  bool isLoading = false;

  _getdatawithoutmodel() {
    isLoading = true;
    ApiService().getsinglepostwithoutmodel().then((value) {
      setState(() {
        singlepost = value;
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    _getdatawithoutmodel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Api data Without model')),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(singlepost['userId'].toString()),
                Text(singlepost['title'].toString()),
                Text(singlepost['body'].toString()),
              ],
            ),
    );
  }
}
