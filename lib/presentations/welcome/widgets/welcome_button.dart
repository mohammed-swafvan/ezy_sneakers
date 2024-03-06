import 'package:ezy_sneakers/core/constants.dart';
import 'package:flutter/material.dart';

class WelcomeButton extends StatelessWidget {
  const WelcomeButton({
    super.key,
    required this.text,
    required this.navigateTo,
    required this.buttonColor,
    required this.textColor,
    required this.borderRadius,
  });
  final Widget navigateTo;
  final String text;
  final Color buttonColor;
  final Color textColor;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => navigateTo,
          ),
        );
      },
      child: Container(
        padding: kEdgeInsetsVert24,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: borderRadius,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
