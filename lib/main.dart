import 'package:flutter/material.dart';
import 'package:meals_app/screens/home_screen.dart';

final theme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 255, 255, 0),
      brightness: Brightness.dark,
    ),
    brightness: Brightness.dark);

void main() {
  runApp(
    MaterialApp(
      theme: theme,
      initialRoute: "/",
      routes: {
        "/": (context) => const HomeScreen(),
      },
    ),
  );
}
