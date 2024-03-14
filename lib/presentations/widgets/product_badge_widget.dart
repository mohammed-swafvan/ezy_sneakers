import 'package:ezy_sneakers/core/colors.dart';
import 'package:ezy_sneakers/core/constants.dart';
import 'package:flutter/material.dart';

class ProductBadgeWidget extends StatelessWidget {
  const ProductBadgeWidget({super.key, required this.badgeColor, required this.badgeTitle});

  final Color badgeColor;
  final String badgeTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 6),
      decoration: BoxDecoration(
        color: badgeColor,
        borderRadius: kBorderRadius04,
      ),
      child: Text(
        badgeTitle,
        style: const TextStyle(
          color: kPrimaryColor,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}