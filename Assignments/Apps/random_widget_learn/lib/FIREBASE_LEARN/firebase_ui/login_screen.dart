import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:random_widget_learn/FIREBASE_LEARN/error_toast.dart';
import 'package:random_widget_learn/FIREBASE_LEARN/firebase_ui/login_with_phone.dart';
import 'package:random_widget_learn/FIREBASE_LEARN/firebase_ui/sign_up_screen.dart';
import 'package:random_widget_learn/FIREBASE_LEARN/firebase_widgets/round_button.dart';
import 'package:random_widget_learn/main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;
  final _formkey = GlobalKey<FormState>();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  void login() {
    setState(() {
      isLoading = true;
    });
    firebaseAuth
        .signInWithEmailAndPassword(
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple,
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
              color: Colors.deepPurple,
              isLoading: isLoading,
              title: 'Login',
              ontap: () {
                if (_formkey.currentState!.validate()) {
                  login();
                  // firebaseAuth.createUserWithEmailAndPassword(
                  //   email: emailcontroller.text.toString(),
                  //   password: passwordcontroller.text.toString(),
                  // ).then((value){
                  //
                  // }).onError((error, stackTrace) {
                  //   ErrorToast().errorhandle(error.toString());
                  // },);
                }
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have an account?"),
              TextButton(
                onPressed: () {
                  setState(() {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()),
                    );
                  });
                },
                child: Text(
                  'Sign up',
                  style: TextStyle(color: Colors.deepPurple),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          InkWell(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginWithPhone()),
              );
            },
            child: Container(
              margin: EdgeInsets.all(8),
              width: double.maxFinite,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(width: 2, color: Colors.black),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(4, 4),
                    // Position: 4px right, 4px down
                    blurRadius: 10,
                    // Softness of the shadow
                    spreadRadius: 2,
                    // Expansion of the shadow
                    blurStyle: BlurStyle.normal, // Blur style
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  'Login With Phone',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
