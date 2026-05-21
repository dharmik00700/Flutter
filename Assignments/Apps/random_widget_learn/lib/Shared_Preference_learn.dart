import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceLearn extends StatefulWidget {
  const SharedPreferenceLearn({super.key});

  @override
  State<SharedPreferenceLearn> createState() => _SharedPreferenceLearnState();
}

class _SharedPreferenceLearnState extends State<SharedPreferenceLearn> {
  String? name;

  Future<void> setuserdata(String username) async {
    final prefer = await SharedPreferences.getInstance();
    prefer.setString('name', username);
  }

  Future<void> getuserdata() async {
    final prefer = await SharedPreferences.getInstance();
    setState(() {
      name = prefer.getString('name') ?? 'Not Data Found';
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getuserdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shared Preferences Learn'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text('Shared Prefence store data'),
          ElevatedButton(
            onPressed: () {
              setuserdata(
                'DHARMIK STORE THIS STRING NAME IN SHARED PREFERENCE',
              );
              getuserdata();
            },
            child: Text('Add & View'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                name = '';
              });
            },
            child: Text('remove'),
          ),
          Text('name : $name'),
        ],
      ),
    );
  }
}
