import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'authenticationprovider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (_) => AuthProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: auth.isLoggedIn ? HomeScreen() : LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: Text('Login'),backgroundColor: Colors.redAccent,),
      body: Center(
        child: ElevatedButton(
          child: Text('Login'),
          onPressed: () {
            auth.login();
          },
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: Text('Home'),backgroundColor: Colors.blueAccent,),
      body: Center(
        child: ElevatedButton(
          child: Text('Logout'),
          onPressed: () {
            auth.logout();
          },
        ),
      ),
    );
  }
}
