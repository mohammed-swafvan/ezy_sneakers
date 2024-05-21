import 'package:flutter/material.dart';

// -- Import app constant colors
import 'package:ezy_sneakers/core/colors.dart';

class SectionViewMoreWidget extends StatelessWidget {
  const SectionViewMoreWidget({super.key, required this.title, required this.onTap});
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      leading: Text(
        title,
        style: const TextStyle(
          color: kSecondaryColor,
          fontSize: 14,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios_rounded,
        color: kSecondaryColor,
        size: 18,
      ),
    );
  }
}