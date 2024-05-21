import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

// -- Import app constant colors
import 'package:ezy_sneakers/core/colors.dart';

// -- Import app constants
import 'package:ezy_sneakers/core/constants.dart';

// -- Import app presentation widgets
import 'package:ezy_sneakers/presentations/product/widgets/only_left_products_widget.dart';
import 'package:ezy_sneakers/presentations/product/widgets/product_sizes_widget.dart';

class ProductMainDetailsSection extends StatelessWidget {
  const ProductMainDetailsSection({super.key, required this.product});
  final Map<String, dynamic> product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // -- Product Brand
          Text(
            product['product_brand'],
            style: const TextStyle(
              fontSize: 13,
              color: kSubtitleColor,
            ),
          ),
          kHeight05,

          // -- Product Name
          Text(
            product['product_name'],
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          kHeight05,

          // -- Product Rating & Revoew Count
          Row(
            children: [
              Container(
                padding: const EdgeInsets.only(right: 4),
                decoration: BoxDecoration(
                  color: kRatingColor,
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Wrap(
                  spacing: 4,
                  runSpacing: 4,
                  children: [
                    // -- Rating Icon
                    const Icon(
                      Iconsax.star1,
                      size: 16,
                      color: kPrimaryColor,
                    ),
                    // -- Reviews Count
                    Text(
                      product['rating'],
                      style: const TextStyle(
                        fontSize: 12,
                        color: kPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              kWidth10,
              // -- Reviews Count of the Product
              Text(
                "${product['review'].length.toString()} Reviews",
                style: const TextStyle(
                  fontSize: 12,
                  color: kSubtitleColor,
                ),
              ),
            ],
          ),
          kHeight08,

          // -- Product Prices and Offers
          Row(
            children: [
              // -- Product Price
              Text(
                "\$${product['price']}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              kWidth06,
              // -- Product Old Price
              Text(
                "\$${product['old_price']}",
                style: const TextStyle(
                  fontSize: 10,
                  color: kLightGrey,
                  overflow: TextOverflow.ellipsis,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              kWidth06,
              // -- Product Offer
              Text(
                "${product['offer']}% OFF",
                style: const TextStyle(
                  fontSize: 10,
                  color: kTopSellerBannerColor,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          kHeight08,

          // -- Only Left products Widget
          OnlyLeftProductsWidget(product: product),
          kHeight10,

          // -- Product Sizes Widget
          ProductSizesWidget(sizes: product['sizes']),
        ],
      ),
    );
  }
}