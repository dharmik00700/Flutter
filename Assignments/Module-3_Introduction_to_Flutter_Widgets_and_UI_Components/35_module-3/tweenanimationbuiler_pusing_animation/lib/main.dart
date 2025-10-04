import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const PulsingButtonScreen(),
    );
  }
}

class PulsingButtonScreen extends StatefulWidget {
  const PulsingButtonScreen({super.key});

  @override
  State<PulsingButtonScreen> createState() => _PulsingButtonScreenState();
}

class _PulsingButtonScreenState extends State<PulsingButtonScreen> {
  double _targetValue = 1.2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pulsing Button Example'),backgroundColor: Color.fromARGB(
          255, 218, 168, 245),),
      body: Center(
        child: TweenAnimationBuilder(
          tween: Tween(begin: 1.0, end: _targetValue),
          duration: const Duration(milliseconds: 700),
          builder: (BuildContext context, double size, Widget? child) {
            return Transform.scale(
              scale: size,
              child: child,
            );
          },
          onEnd: () {
            setState(() {
              _targetValue = _targetValue == 1.0 ? 1.2 : 1.0;
            });
          },
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            ),
            onPressed: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('Button Pressed!')));
            },
            child: Text('Pulsing Button', style: TextStyle(fontSize: 18)),
          ),
        ),
      ),
    );
  }
}
