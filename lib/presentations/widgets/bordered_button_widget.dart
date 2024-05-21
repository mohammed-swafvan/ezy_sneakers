import 'package:flutter/material.dart';

// -- Import app constant colors
import 'package:ezy_sneakers/core/colors.dart';

// -- Import app constants
import 'package:ezy_sneakers/core/constants.dart';

class BorderedButtonWidget extends StatelessWidget {
  const BorderedButtonWidget({super.key, required this.text, required this.onTap});
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: kCardColor,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          shape: RoundedRectangleBorder(
            borderRadius: kBorderRadius06,
            side: const BorderSide(
              color: kPrimaryColor,
            ),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 12,
            color: kSecondaryColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}