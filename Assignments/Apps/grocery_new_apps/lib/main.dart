import 'package:flutter/material.dart';
import 'package:grocery_new_apps/grocery_list.dart';

void main() {
  final maincolor = ColorScheme.fromSeed(
    seedColor: Color.fromARGB(255, 236, 213, 184),
  );
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: maincolor.onPrimaryContainer,
          foregroundColor: maincolor.onPrimary,
        ),
        scaffoldBackgroundColor: maincolor.onPrimaryContainer,
        listTileTheme: ListTileThemeData().copyWith(
          tileColor: maincolor.onPrimaryContainer,
          textColor: maincolor.onPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
      home: GroceryList(),
    ),
  );
}
