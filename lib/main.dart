import 'package:ezy_sneakers/core/app_style.dart';
import 'package:ezy_sneakers/presentations/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ezy Sneakers',
      debugShowCheckedModeBanner: false,
      theme: AppStyle.appTheme,
      home: const WelcomScreen(),
    );
  }
}
