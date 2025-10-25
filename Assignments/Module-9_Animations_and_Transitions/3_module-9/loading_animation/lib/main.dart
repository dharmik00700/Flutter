import 'package:flutter/material.dart';

void main() => runApp(LoadingApp());

class LoadingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoadingScreen(),
    );
  }
}

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  bool isLoading = true;
  String data = '';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    await Future.delayed(Duration(seconds: 15));
    setState(() {
      data = 'Data loaded successfully!';
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Loading Animation'),backgroundColor: Colors.redAccent,),
      body: Center(
        child: isLoading
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Fetching data...'),
                ],
              )
            : Text(
                data,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
      ),
    );
  }
}
