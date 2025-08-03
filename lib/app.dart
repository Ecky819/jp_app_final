import 'package:flutter/material.dart';
import 'package:jp_app/features/start/splash_screen.dart';

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
      home: SplashScreen(),
    );
  }
}
