import 'package:ezy_sneakers/core/colors.dart';
import 'package:ezy_sneakers/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomeSearchWidget extends StatelessWidget {
  const HomeSearchWidget({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: kBorderRadius12,
        border: Border.all(
          color: kSubtitleColor,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        child: const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Iconsax.search_normal_1,
              size: 28,
              color: Colors.black,
            ),
            kWidth10,
            Text(
              "Search Anything...",
              style: TextStyle(
                color: kLightGrey,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            )
          ],
        ),
      ),
    );
  }
}
