import 'package:ezy_sneakers/core/colors.dart';
import 'package:ezy_sneakers/core/constants.dart';
import 'package:ezy_sneakers/presentations/widgets/product_badge_widget.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({
    super.key,
    this.badgeTitle,
    this.badgeColor,
    required this.imageWidth,
    this.imageHeigth,
  });

  final String? badgeTitle;
  final Color? badgeColor;
  final double imageWidth;
  final double? imageHeigth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: imageWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // -- Product Image
          Expanded(
            child: Container(
              width: imageWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: const DecorationImage(
                  image: AssetImage('assets/images/nike-shoe.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                margin: const EdgeInsets.all(4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (badgeColor != null && badgeTitle != null)
                      ProductBadgeWidget(
                        badgeColor: badgeColor!,
                        badgeTitle: badgeTitle!,
                      ),
                    const Spacer(),
                    InkWell(
                      onTap: () async {},
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: kPrimaryColor.withOpacity(0.7),
                        ),
                        child: const Icon(
                          Iconsax.heart5,
                          color: kAlertColor,
                          size: 18,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          kHeight08,
          // -- Prodect Name
          const Text(
            "Nike sketch running shoes for men",
            style: TextStyle(
              fontSize: 15,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.start,
          ),
          kHeight10,
          const Row(
            children: [
              // -- Product Price
              Text(
                "\$75",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              kWidth04,
              // -- Product Old Price
              Text(
                "\$90",
                style: TextStyle(
                  fontSize: 11,
                  color: kLightGrey,
                  overflow: TextOverflow.ellipsis,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              kWidth04,
              // -- Product Offer
              Text(
                "20% OFF",
                style: TextStyle(
                  fontSize: 11,
                  color: kTopSellerBannerColor,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          kHeight08,
          Wrap(
            spacing: 5,
            runSpacing: 5,
            children: [
              // -- Product Rating Icon
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 2).copyWith(left: 0),
                decoration: BoxDecoration(
                  color: kRatingColor,
                  borderRadius: BorderRadius.circular(2),
                ),
                child: const Icon(
                  Iconsax.star1,
                  size: 17,
                  color: kPrimaryColor,
                ),
              ),
              // -- Product Rating
              const Text(
                "4",
                style: TextStyle(
                  fontSize: 15,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              // -- Product Overall Rating
              const Text(
                "(322)",
                style: TextStyle(
                  fontSize: 15,
                  color: kSubtitleColor,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
