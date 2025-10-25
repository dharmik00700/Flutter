import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late SharedPreferences prefs;
  String username = '';
  bool isDarkMode = false;
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadPreferences();
  }

  Future<void> loadPreferences() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username') ?? '';
      isDarkMode = prefs.getBool('isDarkMode') ?? false;
      controller.text = username;
    });
  }

  Future<void> savePreferences() async {
    await prefs.setString('username', controller.text);
    await prefs.setBool('isDarkMode', isDarkMode);
    setState(() {
      username = controller.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(title: Text('User Preferences')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: controller,
                decoration: InputDecoration(labelText: 'Enter your username'),
              ),
              SwitchListTile(
                title: Text('Dark Mode'),
                value: isDarkMode,
                onChanged: (value) {
                  setState(() {
                    isDarkMode = value;
                  });
                },
              ),
              ElevatedButton(
                onPressed: savePreferences,
                child: Text('Save Preferences'),
              ),
              SizedBox(height: 20),
              Text('Saved Username: $username'),
              Text('Theme: ${isDarkMode ? "Dark" : "Light"}'),
            ],
          ),
        ),
      ),
    );
  }
}