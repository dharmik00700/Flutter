import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_with_counter/module.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (_) => countermodel(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterScreen(),
    );
  }
}

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final count = context.watch<countermodel>().counts;
    final counterfunction = Provider.of<countermodel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Counter with Provider',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Counter Value: $count', style: TextStyle(fontSize: 24)),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: counterfunction.increment,
                child: Text('+', style: TextStyle(fontSize: 20)),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: counterfunction.decrement,
                child: Text('-', style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
