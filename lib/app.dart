// app.dart
import 'package:flutter/material.dart';
import 'features/Snack/screens/splash_screen.dart';
import 'features/Snack/screens/home_screen.dart';

class SnackApp extends StatelessWidget {
  const SnackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snack App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.black,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
