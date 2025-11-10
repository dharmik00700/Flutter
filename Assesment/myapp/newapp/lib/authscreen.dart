import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLogin = true;
  bool _loading = false;

  Future<void> _toggle() async {
    setState(() => _isLogin = !_isLogin);
  }

  Future<void> _submit() async {
    String email = _emailController.text.trim();
    String pass = _passwordController.text.trim();
    if (email.isEmpty || pass.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please enter email and password')));
      return;
    }
    setState(() => _loading = true);
    try {
      UserCredential userCred;
      if (_isLogin) {
        userCred = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: pass);
      } else {
        userCred = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: pass);
        final uid = userCred.user?.uid;
        if (uid != null) {
          DatabaseReference ref = FirebaseDatabase.instance.ref('users/$uid');
          await ref.set({
            'email': email,
            'created_at': DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
          });
        }
      }
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('is_logged_in', true);
      Navigator.of(context).pushReplacementNamed('/dashboard');
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message ?? 'Auth error')));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Unexpected error: $e')));
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_isLogin ? 'Login' : 'Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _emailController, decoration: InputDecoration(labelText: 'Email')),
            TextField(controller: _passwordController, decoration: InputDecoration(labelText: 'Password'), obscureText: true),
            SizedBox(height: 12),
            if (_loading) CircularProgressIndicator(),
            if (!_loading) ElevatedButton(onPressed: _submit, child: Text(_isLogin ? 'Login' : 'Create Account')),
            TextButton(onPressed: _toggle, child: Text(_isLogin ? 'Create account' : 'Have an account? Login')),
          ],
        ),
      ),
    );
  }
}


