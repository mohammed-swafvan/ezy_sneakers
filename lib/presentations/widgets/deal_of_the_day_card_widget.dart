import 'package:ezy_sneakers/core/colors.dart';
import 'package:ezy_sneakers/core/constants.dart';
import 'package:ezy_sneakers/presentations/widgets/rounded_image_widget.dart';
import 'package:flutter/material.dart';

class DealOfTheDayCardWidget extends StatelessWidget {
  const DealOfTheDayCardWidget({super.key, this.onTap});
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // -- Product Image
          RoundedImageWidget(
            image: "assets/images/deal-of-the-day.jpeg",
            imageWidth: screenWidth / 2.6,
            imageHeight: screenWidth / 2.6,
            radius: 5,
          ),
          kHeight05,
          // -- Product Name
          Text(
            "Bluetooth Speaker",
            style: Theme.of(context).textTheme.bodyMedium,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          kHeight10,
          // -- Product Offer
          Container(
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 6),
            decoration: BoxDecoration(
              color: kAlertColor,
              borderRadius: kBorderRadius04,
            ),
            child: Text(
              "40-60% OFF",
              style: const TextStyle(
                color: kPrimaryColor,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
