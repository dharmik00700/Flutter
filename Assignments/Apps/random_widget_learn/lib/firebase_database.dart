import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:random_widget_learn/FIREBASE_LEARN/error_toast.dart';
import 'package:random_widget_learn/FIREBASE_LEARN/firebase_widgets/round_button.dart';
import 'package:random_widget_learn/getx_statemanagement.dart';

class FirebaseDatabase_Screen extends StatefulWidget {
  const FirebaseDatabase_Screen({super.key});

  @override
  State<FirebaseDatabase_Screen> createState() =>
      _FirebaseDatabase_ScreenState();
}

class _FirebaseDatabase_ScreenState extends State<FirebaseDatabase_Screen> {
  final controller = TextEditingController();
  final child = TextEditingController();
  final Id = TextEditingController();

  final data = TextEditingController();

  final formkey = GlobalKey<FormState>();
  late final firebasedatabase = FirebaseDatabase.instance.ref(controller.text);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Database Insert'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Table Name:',
                  ),
                ),
                SizedBox(height: MediaQuery.heightOf(context) * 0.01),
                TextFormField(
                  controller: child,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter child Id Name:',
                  ),
                ),
                SizedBox(height: MediaQuery.heightOf(context) * 0.01),

                TextFormField(
                  controller: Id,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter data Name:',
                  ),
                ),
                SizedBox(height: MediaQuery.heightOf(context) * 0.01),
                TextFormField(
                  controller: data,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter data Name:',
                  ),
                ),
                SizedBox(height: MediaQuery.heightOf(context) * 0.01),
                RoundButton(
                  title: 'Insert Data',
                  ontap: () {
                    firebasedatabase
                        .child(child.text)
                        .set({'Id': data.text})
                        .then((value) {
                          ErrorToast().errorhandle('table data added', context);
                        })
                        .onError((error, stackTrace) {
                          ErrorToast().errorhandle(error.toString(), context);
                        });
                    Navigator.pop(context);
                  },
                  color: Colors.teal,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
