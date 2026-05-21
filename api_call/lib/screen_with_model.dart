import 'package:api_call/Single_Post_With_Model.dart';
import 'package:api_call/api_service.dart';
import 'package:flutter/material.dart';

class ScreenWithModel extends StatefulWidget {
  const ScreenWithModel({super.key});

  @override
  State<ScreenWithModel> createState() => _ScreenWithModelState();
}

class _ScreenWithModelState extends State<ScreenWithModel> {
  SinglePostWithModel singlePostWithModel = SinglePostWithModel();
  bool isLoading = false;

  _getpost() {
    isLoading = true;
    ApiService().getsinglepostwithmodel().then((value) {
      setState(() {
        singlePostWithModel = value!;
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    _getpost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('APi Handle')),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  singlePostWithModel.userId.toString(),
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  singlePostWithModel.title.toString(),
                  style: TextStyle(fontSize: 18, color: Colors.blueAccent),
                ),
                Text(
                  singlePostWithModel.body.toString(),
                  style: TextStyle(fontSize: 15, color: Colors.blue[200]),
                ),
              ],
            ),
    );
  }
}
