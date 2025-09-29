import 'screens/places_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor:  Color.fromARGB(255,225, 213, 201 ),
  primarySwatch: Colors.indigo,

  textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.black)),
);
final theme = ThemeData().copyWith(
  colorScheme: lightTheme.colorScheme.copyWith(),
  textTheme: GoogleFonts.dancingScriptTextTheme().copyWith(
    titleSmall: GoogleFonts.dancingScript(fontWeight: FontWeight.bold),
    titleMedium: GoogleFonts.dancingScript(fontWeight: FontWeight.bold),
    titleLarge: GoogleFonts.dancingScript(fontWeight: FontWeight.bold),
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  floatingActionButtonTheme:FloatingActionButtonThemeData().copyWith(
    backgroundColor:  Color.fromARGB(255,225, 213, 201 )
  ),
  primarySwatch: Colors.indigo,
  scaffoldBackgroundColor: Colors.black,
  textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.white)),
);

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      theme: theme,
      darkTheme: darkTheme,
      home: PlacesScreen(),
    );
  }
}
