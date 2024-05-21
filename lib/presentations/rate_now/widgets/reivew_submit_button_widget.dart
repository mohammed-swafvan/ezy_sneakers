import 'package:flutter/material.dart';

// -- Import app constant colors
import 'package:ezy_sneakers/core/colors.dart';

// -- Import app constants
import 'package:ezy_sneakers/core/constants.dart';

class ReviewSubmitButtonWidget extends StatelessWidget {
  const ReviewSubmitButtonWidget({super.key, required this.text, required this.onTap});
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.height;
    return Container(
      padding: kEdgeInsetsHoriz16,
      width: screenWidth,
      height: 50,
      child: ElevatedButton(
        onPressed: onTap,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            color: kPrimaryColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}