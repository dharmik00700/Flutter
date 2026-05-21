import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_firebase/signup_screen.dart';
import 'package:login_firebase/wrapper_screen.dart';

import 'home_screen.dart';
import 'login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UI',
      initialRoute: '/',
      routes: {
        '/': (_) => WrapperScreen(),
        '/home': (_) => HomeScreen(),
        '/login': (_) => LoginScreen(),
        '/signup': (_) => SignUpScreen(), // Add this line
      },
    );
  }
}
