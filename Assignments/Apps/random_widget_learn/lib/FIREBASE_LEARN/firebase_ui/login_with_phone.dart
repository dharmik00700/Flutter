import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:random_widget_learn/FIREBASE_LEARN/firebase_ui/verify_code.dart';
import 'package:random_widget_learn/FIREBASE_LEARN/firebase_widgets/round_button.dart';

import '../error_toast.dart';

class LoginWithPhone extends StatefulWidget {
  const LoginWithPhone({super.key});

  @override
  State<LoginWithPhone> createState() => _LoginWithPhoneState();
}

class _LoginWithPhoneState extends State<LoginWithPhone> {
  bool isLoading = false;
  final auth = FirebaseAuth.instance;
  final _formkey = GlobalKey<FormState>();
  final phonecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login With Phone',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(height: 30),

            TextFormField(
              keyboardType: TextInputType.phone,
              controller: phonecontroller,
              decoration: InputDecoration(
                label: Text('Mobile.No:'),
                prefixIcon: Icon(Icons.phone),
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
            SizedBox(height: 30),
            RoundButton(
              title: 'Login',
              ontap: () {
                setState(() {
                  isLoading = true;
                });
                auth.verifyPhoneNumber(
                  phoneNumber: phonecontroller.text,
                  verificationCompleted: (phoneAuthCredential) {
                    setState(() {
                      isLoading = false;
                    });
                  },
                  verificationFailed: (error) {
                    setState(() {
                      isLoading = false;
                    });
                    ErrorToast().errorhandle(error.toString(), context);
                  },
                  codeSent: (verificationId, forceResendingToken) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            VerifyCodeScreen(verificationId: verificationId),
                      ),
                    );
                    setState(() {
                      isLoading = false;
                    });
                  },
                  codeAutoRetrievalTimeout: (verificationId) {
                    setState(() {
                      isLoading = false;
                    });
                    ErrorToast().errorhandle(
                      verificationId.toString(),
                      context,
                    );
                  },
                );
              },
              isLoading: isLoading,
              color: Colors.deepOrangeAccent,
            ),
          ],
        ),
      ),
    );
  }
}
