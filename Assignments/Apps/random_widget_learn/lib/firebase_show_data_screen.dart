import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

import 'firebase_database.dart';

class FirebaseShowDataScreen extends StatefulWidget {
  const FirebaseShowDataScreen({super.key});

  @override
  State<FirebaseShowDataScreen> createState() => _FirebaseShowDataScreenState();
}

class _FirebaseShowDataScreenState extends State<FirebaseShowDataScreen> {
  final auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref('firsttable');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Databse Data Show'),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        elevation: 6,
        child: Icon(Icons.add),
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FirebaseDatabase_Screen()),
          );
        },
      ),
      body: Column(
        children: [
          Expanded(
            child: FirebaseAnimatedList(
              query: ref,
              itemBuilder: (context, snapshot, animation, index) {
                return ListTile(
                  title: Text(
                    "${snapshot.child('Id').key.toString()} : ${snapshot.child('Id').value.toString()}",
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
