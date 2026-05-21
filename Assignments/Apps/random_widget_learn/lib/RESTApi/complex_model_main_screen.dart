import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:random_widget_learn/RESTApi/user_model.dart';
import 'package:http/http.dart' as http;

class ComplexModelMainScreen extends StatefulWidget {
  const ComplexModelMainScreen({super.key});

  @override
  State<ComplexModelMainScreen> createState() => _ComplexModelMainScreenState();
}

class _ComplexModelMainScreenState extends State<ComplexModelMainScreen> {
  List<UserModel> userlist = [];

  Future<List<UserModel>> getuseapidata() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users'),
    );
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        userlist.clear();
        userlist.add(UserModel.fromJson(i));
      }
      return userlist;
    }
    return userlist;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Complex Model')));
  }
}
