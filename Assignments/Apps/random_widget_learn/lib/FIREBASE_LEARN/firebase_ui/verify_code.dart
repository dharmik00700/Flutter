import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:random_widget_learn/main.dart';

import '../error_toast.dart';
import '../firebase_widgets/round_button.dart';

class VerifyCodeScreen extends StatefulWidget {
  final String verificationId;

  const VerifyCodeScreen({super.key, required this.verificationId});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  bool isLoading = false;
  final auth = FirebaseAuth.instance;
  final _formkey = GlobalKey<FormState>();
  final verifycontroller = TextEditingController();

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
              controller: verifycontroller,
              obscureText: true,
              decoration: InputDecoration(
                label: Text('VERIFY:'),
                prefixIcon: Icon(Icons.verified),
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
              title: 'Verify',
              ontap: () async {
                setState(() {
                  isLoading = true;
                });
                final credientals = PhoneAuthProvider.credential(
                  verificationId: widget.verificationId,
                  smsCode: verifycontroller.text.toString(),
                );
                try {
                  await auth.signInWithCredential(credientals);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => AllWidgetsCover()),
                  );
                } catch (e) {
                  setState(() {
                    isLoading = false;
                  });
                  ErrorToast().errorhandle(e.toString(), context);
                }
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
