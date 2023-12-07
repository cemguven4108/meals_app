import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/screens/favorites_screen.dart';
import 'package:meals_app/screens/home_screen.dart';
import 'package:meals_app/screens/meals_screen.dart';

final theme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 255, 255, 0),
      brightness: Brightness.dark,
    ),
    brightness: Brightness.dark);

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        initialRoute: "/",
        routes: {
          "/": (context) => const HomeScreen(),
          "/meals": (context) => const MealsScreen(),
          "/favorites": (context) => const FavoritesScreen(),
        },
      ),
    ),
  );
}
