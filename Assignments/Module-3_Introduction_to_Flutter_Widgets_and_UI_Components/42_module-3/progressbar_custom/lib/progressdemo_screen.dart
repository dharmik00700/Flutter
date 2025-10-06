import 'package:flutter/material.dart';
import 'progress_bar.dart';

class ProgressDemoScreen extends StatefulWidget {
  @override
  _ProgressDemoScreenState createState() => _ProgressDemoScreenState();
}

class _ProgressDemoScreenState extends State<ProgressDemoScreen> {
  double _progress = 0;

  void _increaseProgress() {
    setState(() {
      _progress = (_progress + 10).clamp(0, 100);
    });
  }

  void _decreaseProgress() {
    setState(() {
      _progress = (_progress - 10).clamp(0, 100);
    });
  }

  void _resetProgress() {
    setState(() {
      _progress = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Progress Bar Demo',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(255, 10, 12, 103),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProgressBar(
              percentage: _progress,
              height: 25,
              progressColor: Colors.green,
              backgroundColor: Colors.grey.shade300,
            ),
            SizedBox(height: 20),
            Text('${_progress.toInt()}%', style: TextStyle(fontSize: 18)),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: _progress == 100 ? null : _increaseProgress,
              child: Text('Increase Progress'),
            ),
            TextButton(onPressed: _resetProgress, child: Text('Reset')),

            ElevatedButton(
              onPressed: _progress == 0 ? null : _decreaseProgress,
              child: Text('Decrease Progress'),
            ),
          ],
        ),
      ),
    );
  }
}
