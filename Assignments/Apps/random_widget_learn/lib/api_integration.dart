import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:random_widget_learn/api.dart';
import 'package:random_widget_learn/remoteserver.dart';

class ApiIntegration extends StatefulWidget {
  const ApiIntegration({super.key});

  @override
  State<ApiIntegration> createState() => _ApiIntegrationState();
}

class _ApiIntegrationState extends State<ApiIntegration> {
  late List<Post>? posts;
  var isloading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  getdata() async {
    posts = await Remoteserver().getPosts();
    if (posts != null) {
      setState(() {
        isloading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api Integration'),
        backgroundColor: Colors.purpleAccent,
      ),
      body: ListView.builder(
        itemCount: posts?.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text(posts![index].title));
        },
      ),
    );
  }
}
