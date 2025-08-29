import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Assets_Images(), debugShowCheckedModeBanner: false));
}

class Assets_Images extends StatelessWidget {
  const Assets_Images({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Image fit',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.black,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 234, 215, 243),
      ),
      backgroundColor: Color.fromARGB(255, 246, 1, 1),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 300,
                child: Image.asset('assets/images/car1.jpg', fit: BoxFit.cover),
              ),
              SizedBox(height: 15),
              Container(
                height: 300,
                width: double.infinity,
                color: Colors.grey[300],
                child: Image.asset('assets/images/car2.jpg', fit: BoxFit.contain),
              ),
              SizedBox(height: 15),
              Container(
                height: 300,
                width: double.infinity,
                color: Colors.grey[300],
                child: Image.asset('assets/images/car3.jpg', fit: BoxFit.fill),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
