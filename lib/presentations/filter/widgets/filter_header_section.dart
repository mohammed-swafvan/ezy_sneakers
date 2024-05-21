import 'package:flutter/material.dart';

// -- Import app constant colors
import 'package:ezy_sneakers/core/colors.dart';

class FilterHeaderSection extends StatelessWidget {
  const FilterHeaderSection({super.key, required this.onBackButton, required this.onClearAllButton});
  final VoidCallback onBackButton;
  final VoidCallback onClearAllButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(6, 40, 12, 0),
      color: kPrimaryColor,
      child: Row(
        children: [
          // -- Back Button
          IconButton(
            onPressed: onBackButton,
            icon: const Icon(
              Icons.close,
              size: 26,
            ),
          ),
          // -- Title
          const Expanded(
            child: Text(
              "Filter",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          // --
          InkWell(
            onTap: onClearAllButton,
            child: const Text(
              "CLEAR ALL",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: kSubtitleColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
