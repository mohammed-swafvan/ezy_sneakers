import 'package:ezy_sneakers/core/app_style.dart';
import 'package:ezy_sneakers/presentations/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Ezy Sneakers',
      debugShowCheckedModeBanner: false,
      theme: AppStyle.appTheme,
      home: const WelcomScreen(),
    );
  }
}
