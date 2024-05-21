import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

// -- Import app constant colors
import 'package:ezy_sneakers/core/colors.dart';

// -- Import app constants
import 'package:ezy_sneakers/core/constants.dart';

class SnackBarUtils {
  static mainSnackBar({required BuildContext context, required String content}) {
    return SnackBar(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(vertical: 5),
      shape: RoundedRectangleBorder(borderRadius: kBorderRadius04),
      behavior: SnackBarBehavior.floating,
      showCloseIcon: true,
      closeIconColor: kPrimaryColor.withOpacity(0.5),
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.black,
      clipBehavior: Clip.antiAlias,
      content: Row(
        children: [
          const Icon(
            Iconsax.tick_circle5,
            size: 22,
            color: kPrimaryColor,
          ),
          kWidth20,
          Text(
            content,
            style: const TextStyle(
              color: kPrimaryColor,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}