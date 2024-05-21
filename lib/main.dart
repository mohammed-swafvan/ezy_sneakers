import 'package:ezy_sneakers/core/app_style.dart';
import 'package:ezy_sneakers/presentations/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
