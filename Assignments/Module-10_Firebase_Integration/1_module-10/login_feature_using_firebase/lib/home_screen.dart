import 'package:flutter/material.dart';
import 'auth_service.dart';

class HomeScreen extends StatelessWidget {
  final authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await authService.logout();
              Navigator.pushReplacementNamed(context, '/login');
            },
          )
        ],
      ),
      body: Center(child: Text('You are logged in!')),
    );
  }
}