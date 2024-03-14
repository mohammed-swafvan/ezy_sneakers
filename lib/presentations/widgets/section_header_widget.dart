import 'package:ezy_sneakers/core/colors.dart';
import 'package:flutter/material.dart';

class SectionHeaderWidget extends StatelessWidget {
  const SectionHeaderWidget({
    super.key,
    required this.sectionTitle,
    this.onViewAllTap,
  });
  final String sectionTitle;
  final VoidCallback? onViewAllTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // -- Section Headed Title
        Text(
          sectionTitle,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
    
        // -- Section Headed Triling
        InkWell(
          onTap: onViewAllTap,
          child: const Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            direction: Axis.horizontal,
            spacing: 4,
            runSpacing: 4,
            children: [
              Text(
                "View All",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: kSubtitleColor,
                ),
              ),
              Icon(
                Icons.arrow_forward,
                color: kSubtitleColor,
                size: 14,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
