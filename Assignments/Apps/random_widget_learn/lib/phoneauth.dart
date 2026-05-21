import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:random_widget_learn/otpscreen.dart';

class Phoneauth extends StatefulWidget {
  const Phoneauth({super.key});

  @override
  State<Phoneauth> createState() => _PhoneauthState();
}

class _PhoneauthState extends State<Phoneauth> {
  TextEditingController number = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('phone authentication'),
        centerTitle: true,
        backgroundColor: Colors.purpleAccent,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: number,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.numbers),
                  hintText: 'Enter Phone Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(width: 2, color: Colors.black),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(width: 2, color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(width: 2, color: Colors.black),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async {
                String rawNumber = number.text.trim();
                if (rawNumber.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Please enter a phone number")),
                  );
                  return;
                }

                // Sanitize: Remove all non-digit characters (except + if at start)
                String formattedNumber;
                if (rawNumber.startsWith('+')) {
                  // User included country code
                  formattedNumber = rawNumber;
                } else {
                  // Assume user entered local number, prepending default country code +91
                  // Remove any spaces or dashes they might have typed
                  String digits = rawNumber.replaceAll(RegExp(r'\D'), '');
                  if (digits.length == 10) {
                     formattedNumber = '+91$digits';
                  } else {
                     // If it's not 10 digits, we can try prepending + if they typed a full country code without +
                     // or just hope +91 works. Let's assume +91 for 10 digits, otherwise take as is with +
                     formattedNumber = '+$digits';
                  }
                }

                await FirebaseAuth.instance.verifyPhoneNumber(
                  verificationCompleted: (phoneAuthCredential) {},
                  verificationFailed: (FirebaseAuthException error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(error.message ?? "Verification failed")),
                    );
                  },
                  codeSent: (verificationId, forceResendingToken) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => Otpscreen(
                          verificationid: verificationId,
                        ),
                      ),
                    );
                  },
                  codeAutoRetrievalTimeout: (verificationId) {},
                  phoneNumber: formattedNumber,
                );
              },
              child: Text('Phone Authentication'),
            ),
          ],
        ),
      ),
    );
  }
}
