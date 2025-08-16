import 'package:flutter/material.dart';

void main() {
  runApp(const myapp());
}
class myapp extends StatelessWidget {
  const myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: hello_world(),debugShowCheckedModeBanner: false,);
  }
}

class hello_world extends StatefulWidget {
  const hello_world({super.key});

  @override
  State<hello_world> createState() => _hello_worldState();
}

class _hello_worldState extends State<hello_world> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Hello,Flutter!')),
    );
  }
}

