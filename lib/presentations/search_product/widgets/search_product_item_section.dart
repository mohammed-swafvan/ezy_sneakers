import 'package:ezy_sneakers/presentations/product/product_screen.dart';
import 'package:ezy_sneakers/presentations/widgets/product_card_widget.dart';
import 'package:flutter/material.dart';

// -- Import app constant colors
import 'package:ezy_sneakers/core/colors.dart';

// -- Import app presentatin widgets

class SearchedProductsItemsSection extends StatelessWidget {
  const SearchedProductsItemsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    Map<String, dynamic> product = {
      "id": 7,
      "images": [
        "assets/images/sneaker_0.webp",
        "assets/images/sneaker_2.webp",
        "assets/images/sneaker_6.webp"
      ],
      "product_name": "ClassicFit Unisex Canvas Sneakers",
      "product_brand": "Nike",
      "product_description":
          "Step out in style with the ClassicFit Unisex Canvas Sneakers. These versatile sneakers feature a timeless design and lightweight construction, perfect for everyday wear.",
      "product_category": "Men's Shoes",
      "product_type": "hot selling footwear",
      "product_badge": true,
      "price": "29.99",
      "old_price": "39.99",
      "offer": "25",
      "specifications": {
        "Material": "Canvas upper",
        "Closure": "Slip-On",
        "Sole Material": "Rubber",
        "Footwear Type": "Casual Sneakers"
      },
      "color": "Black-Red",
      "only_left": [
        "assets/images/sneaker_7.webp",
        "assets/images/sneaker_8.webp",
        "assets/images/sneaker_9.webp"
      ],
      "sizes": [
        {"size": "7", "out_of_stock": false},
        {"size": "8", "out_of_stock": false},
        {"size": "9", "out_of_stock": false}
      ],
      "rating": "4.6",
      "overall_rating": "700",
      "review": [
        {
          "review_send_by": "James",
          "review_date": "15th Jan 2024",
          "review_heading": "First review",
          "review_description": "review Description",
          "review_rating": 3.3,
          "review_images": [
            "assets/images/sneaker_1.webp",
            "assets/images/sneaker_3.webp",
            "assets/images/sneaker_5.webp"
          ]
        }
      ]
    };
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            "${product.length} Items",
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
        Container(
          width: screenWidth,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          color: kPrimaryColor.withOpacity(0.5),
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(top: 16),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 18,
              crossAxisSpacing: 18,
              mainAxisExtent: 276,
            ),
            itemBuilder: (context, index) {
              double imageWidth = (screenWidth - 18 * 3) / 2;
              // -- Product Category Items Card
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductScreen(product: product),
                    ),
                  );
                },
                child: ProductCardWidget(
                  // product: product,
                  imageWidth: imageWidth,
                  badgeTitle: "Trending",
                  badgeColor: kTrendingBannerColor,
                ),
              );
            },
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}
