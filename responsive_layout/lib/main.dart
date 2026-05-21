import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_layout/responsive_layout/desktop_screen.dart';
import 'package:responsive_layout/responsive_layout/mobile_screen.dart';
import 'package:responsive_layout/responsive_layout/responsive_layout_device.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ResponsiveApp(),
    );
  }
}

class ResponsiveApp extends StatefulWidget {
  const ResponsiveApp({super.key});

  @override
  State<ResponsiveApp> createState() => _ResponsiveAppState();
}

class _ResponsiveAppState extends State<ResponsiveApp> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutDevice(
      mobilescreen: MobileScreen(),
      desktopscreen: DesktopScreen(),
    );
  }
}
