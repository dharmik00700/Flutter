import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

import 'authscreen.dart';

class SplashAndAuthWrapper extends StatefulWidget {
  @override
  _SplashAndAuthWrapperState createState() => _SplashAndAuthWrapperState();
}

class _SplashAndAuthWrapperState extends State<SplashAndAuthWrapper> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _toLogin = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.repeat(reverse: true);
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _toLogin = true;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _toLogin ? AuthScreen() : Scaffold(
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FlutterLogo(size: 120),
              SizedBox(height: 12),
              Text('MyCityConnect', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
