import 'package:ezy_sneakers/core/constants.dart';
import 'package:ezy_sneakers/presentations/filter/filter_screen.dart';
import 'package:ezy_sneakers/presentations/search_product/widgets/search_product_bottom_sheet.dart';
import 'package:ezy_sneakers/presentations/search_product/widgets/search_product_item_section.dart';
import 'package:ezy_sneakers/presentations/utils/bottom_sheet_utils.dart';
import 'package:ezy_sneakers/presentations/widgets/header_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SearchProductsScreen extends StatefulWidget {
  const SearchProductsScreen({super.key, required this.category});
  final String category;

  @override
  State<SearchProductsScreen> createState() => _SearchProductsScreenState();
}

class _SearchProductsScreenState extends State<SearchProductsScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      initializeProducts();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SizedBox(
        height: screenHeight,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // -- Product Category Header Section
                    HeaderSection(
                      title: widget.category,
                      leadingIcon: Iconsax.arrow_left,
                      product: product,
                      onLeadingButton: () {
                        Navigator.of(context).pop();
                      },
                      actionIcons: const [
                        {"icon": Iconsax.search_normal_1, "notification": false},
                        {"icon": Iconsax.bag_2, "notification": false},
                      ],
                    ),

                    // -- Product Category Items Section
                    const SearchedProductsItemsSection(),
                  ],
                ),
              ),
            ),

            // -- Product Category Bottom Section
            SearchProductBottomSection(
                onSortButtonTap: () {
                  BottomSheetUtils.mainBottomSheet(
                    context,
                    "SortBy",
                    ksortByFilterItems,
                  );
                },
                onFilterButtonTap: () {
                  Get.to(
                    () => const FilterScreen(),
                    transition: Transition.fadeIn,
                  );
                },
              ),
          ],
        ),
      ),
    );
  }

  initializeProducts() async {}

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
          "review_rating": 3,
          "review_images": [
            "assets/images/sneaker_1.webp",
            "assets/images/sneaker_3.webp",
            "assets/images/sneaker_5.webp"
          ]
        }
      ]
    };
}
