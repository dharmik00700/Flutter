
import 'package:flutter/material.dart';
import 'package:newapp/profilescreen.dart';
import 'package:newapp/splashScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'DashboardScreen.dart';
import 'mybookingscreen.dart';


const String mockApiUrl = 'https://63b4b9f3f7c74b9d6f2b9b3c.mockapi.io/api/services';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyCityConnectApp());
}

class MyCityConnectApp extends StatefulWidget {
  @override
  _MyCityConnectAppState createState() => _MyCityConnectAppState();
}

class _MyCityConnectAppState extends State<MyCityConnectApp> {
  bool _initialized = false;
  bool _error = false;
  bool _isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool logged = prefs.getBool('is_logged_in') ?? false;
      setState(() {
        _initialized = true;
        _isLoggedIn = logged;
      });
    } catch (e) {
      setState(() {
        _error = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_error) {
      return MaterialApp(home: Scaffold(body: Center(child: Text('Failed to initialize app'))));
    }
    if (!_initialized) {
      return MaterialApp(
        home: Scaffold(
          body: Center(child: SpinKitCircle(size: 60.0)),
        ),
      );
    }
    return MaterialApp(
      title: 'MyCityConnect',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: {
        '/': (ctx) => _isLoggedIn ? DashboardScreen() : SplashAndAuthWrapper(),
        '/dashboard': (ctx) => DashboardScreen(),
        '/bookings': (ctx) => MyBookingsScreen(),
        '/profile': (ctx) => ProfileScreen(),
      },
    );
  }
}


