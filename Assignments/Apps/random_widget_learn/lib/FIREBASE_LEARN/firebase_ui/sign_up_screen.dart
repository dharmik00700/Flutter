import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:random_widget_learn/FIREBASE_LEARN/error_toast.dart';
import 'package:random_widget_learn/FIREBASE_LEARN/firebase_ui/login_screen.dart';
import 'package:random_widget_learn/FIREBASE_LEARN/firebase_widgets/round_button.dart';

import '../../main.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  bool isLoading = false;

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  void Signup() {
    setState(() {
      isLoading = true;
    });
    firebaseAuth
        .createUserWithEmailAndPassword(
          email: emailcontroller.text.toString(),
          password: passwordcontroller.text.toString(),
        )
        .then((value) {
      setState(() {
        isLoading = false;
      });
          ErrorToast().errorhandle(value.user!.email.toString(), context);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => AllWidgetsCover()),
          );


        })
        .onError((error, stackTrace) {
          ErrorToast().errorhandle(error.toString(), context);
          setState(() {
            isLoading = false;
          });
        });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            key: _formkey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: emailcontroller,
                    decoration: InputDecoration(
                      label: Text('Email:'),
                      prefixIcon: Icon(Icons.alternate_email_outlined),
                      focusedBorder: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: passwordcontroller,
                    obscureText: true,
                    decoration: InputDecoration(
                      label: Text('Password:'),
                      prefixIcon: Icon(Icons.lock_open),
                      focusedBorder: OutlineInputBorder(),
                      border: OutlineInputBorder(),

                      enabledBorder: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),
          ),
          Center(
            child: RoundButton(
              color: Colors.teal,
              isLoading: isLoading,
              title: 'Sign Up',
              ontap: () {
                if (_formkey.currentState!.validate()) {
                  Signup();
                }
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Already have an account?"),
              TextButton(
                onPressed: () {
                  setState(() {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  });
                },
                child: Text('Login up', style: TextStyle(color: Colors.teal)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
