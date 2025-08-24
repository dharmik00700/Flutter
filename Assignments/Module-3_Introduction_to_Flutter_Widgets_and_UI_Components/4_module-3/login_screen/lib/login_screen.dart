import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Login Screen",
            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
          ),
          backgroundColor: Color.fromARGB(100, 54, 149, 246),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              TextField(
              keyboardType: TextInputType.emailAddress,
              controller: email,
              decoration: InputDecoration(
                label: Text(
                  'Email',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(21),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(21),
                  borderSide: BorderSide(width: 2, color: Colors.red),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.greenAccent),
                  borderRadius: BorderRadius.circular(21),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              obscureText: true,
              controller: password,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                label: Text(
                  'Password',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(21),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(21),
                  borderSide: BorderSide(width: 2, color: Colors.red),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.greenAccent),
                  borderRadius: BorderRadius.circular(21),
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {

                });
              },
              child: Text('Login', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                backgroundColor: Color.fromARGB(200, 0, 255, 217),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Result :",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 21,
              ),
            ),
            SizedBox(height: 20),
            FittedBox(
              child: Text("Email : ${email.text}",
                style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 21,
              ),
                        ),
            ),
          const SizedBox(height: 10),
          FittedBox(
            child: Text("Password : ${password.text}",
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 21,
              ),
            ),
          ),
          ],
        ),
      ),
    ),)
    ,
    );
  }
}
