import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:switch_theme_using_provider/themeprovider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (_) => ThemeProvider(), child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeprovider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: themeprovider.thememodes,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeprovider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme Switcher'),

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Switch(
              value: themeprovider.isdarkmode,
              onChanged: themeprovider.toggletheme,
              activeThumbColor: Colors.black,
              activeTrackColor: Colors.orange,
              inactiveThumbColor: Colors.black,
              inactiveTrackColor: Colors.grey,
              splashRadius: 20,
            ),
          ),
        ],
      ),
    );
  }
}
