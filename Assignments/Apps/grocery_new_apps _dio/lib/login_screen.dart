import 'package:flutter/material.dart';
import 'package:grocery_new_apps/grocery_list.dart';
import 'package:grocery_new_apps/service/auth_service.dart';
import 'package:grocery_new_apps/succesfullyloginvalues.dart';
import 'package:lottie/lottie.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}



class _LoginScreenState extends State<LoginScreen> {
  // final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();
  final formkey = GlobalKey<FormState>();
  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  var enteredName = '';
  var enteredPassword = '';

  @override
  void initState() {
      ckecklogin();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    focusNode1.dispose();
    focusNode2.dispose();
    super.dispose();
  }

  Future<void> ckecklogin() async {
    String? token = await AuthService().gettoken();
    print("-----TOkEN is [ $token ] -----");
    if (token != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => GroceryList()),
      );
    }
  }

  void login() async {
    if (formkey.currentState!.validate()) {
      formkey.currentState?.save();
      try {
        final authservice = AuthService();
        String? token = await authservice.login(enteredName, enteredPassword);
        print("-----TOkEN is [ $token ] -----");
        if (token == null) {
          //display error message
        }
        if (token != null) {
          setState(() {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => Loginsuceesfully()),
            );
          });
        }
      } catch (ex) {
        print(ex.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 255, 255, 255),
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: Form(
            key: formkey,
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 35),
                    Text(
                      'Login Screen',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Lottie.asset(
                      'assets/animation/Pin code Password Protection, Secure Login animation.json',
                      animate: true,
                      height: 350,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        focusNode: focusNode1,
                        textInputAction: TextInputAction.next,
                        onSaved: (values) {
                          enteredName = values!;
                        },
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(focusNode2);
                        },
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.trim().length <= 1 ||
                              value.trim().length > 50) {
                            return "Must be between 1 and 50 characters.";
                          }
                          return null;
                          // if (!RegExp(
                          //   r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$',
                          // ).hasMatch(values!)) {
                          //   return 'Enter a Valid Email Id';
                          // }
                          // return null;
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Email:',
                          labelStyle: TextStyle(color: Colors.white),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              width: 3,
                              color: Colors.white,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.white,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        focusNode: focusNode2,
                        textInputAction: TextInputAction.done,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).unfocus();
                        },
                        onSaved: (values) {
                          enteredPassword = values!;
                        },

                        obscureText: true,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.trim().length <= 1 ||
                              value.trim().length > 50) {
                            return "Must be between 1 and 50 characters.";
                          }
                          return null;
                          //
                          // if (!RegExp(
                          //   r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                          // ).hasMatch(values!)) {
                          //   return 'Enter a Valid Password';
                          // }
                          // return null;
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Password :',

                          labelStyle: TextStyle(color: Colors.white),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              width: 3,
                              color: Colors.white,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.white,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    ElevatedButton(
                      onPressed: login,
                      child: Text('Login', style: TextStyle(fontSize: 25)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 86, 75, 75),
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
