import 'package:ezy_sneakers/core/image_string.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            ImageString.authScreenBgImage,
            height: screenHeight,
            width: screenWidth,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: child,
          ),
        ],
      ),
    );
  }
}
