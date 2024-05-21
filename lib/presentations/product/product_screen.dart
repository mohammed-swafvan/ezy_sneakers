import 'package:ezy_sneakers/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

// -- Import app presentation utils
import 'package:ezy_sneakers/presentations/utils/snack_bar_utils.dart';

// -- Import app presentation widgets
import 'package:ezy_sneakers/presentations/product_images/product_images_screen.dart';
import 'package:ezy_sneakers/presentations/widgets/bottom_botton_widget.dart';
import 'package:ezy_sneakers/presentations/widgets/header_section.dart';
import 'package:ezy_sneakers/presentations/widgets/slider_image_section.dart';
import 'package:ezy_sneakers/presentations/product/widgets/product_main_details_section.dart';
import 'package:ezy_sneakers/presentations/product/widgets/product_delivery_options_section.dart';
import 'package:ezy_sneakers/presentations/product/widgets/product_details_section.dart';
import 'package:ezy_sneakers/presentations/product/widgets/product_rate_review_section.dart';


class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key, required this.product});
  final Map<String, dynamic> product;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kScaffoldBgColor,
      body: SizedBox(
        height: screenHeight,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // -- Header Section
                    HeaderSection(
                      isProductScreen: true,
                      product: product,
                      leadingIcon: Iconsax.arrow_left,
                      onLeadingButton: () {
                        Navigator.of(context).pop();
                      },
                      actionIcons: const [
                        {
                          "icon": Iconsax.heart5,
                          "notification": false,
                        },
                        {"icon": Icons.share_outlined, "notification": false},
                        {"icon": Iconsax.bag_2, "notification": true},
                      ],
                    ),

                    // -- Slider Image Section
                    SliderImageSection(
                      images: product['images'],
                      imageOnTap: (int imageIndex) {
                        Get.to(
                          () => ProductImagesScreen(
                            images: product['images'],
                            initialIndex: imageIndex,
                          ),
                          transition: Transition.fadeIn,
                        );
                      },
                    ),

                    // -- Product Main Details Section
                    ProductMainDetailsSection(product: product),

                    // -- Product Delivery Options Section
                    const ProductDeliveryOptionsSection(),

                    // -- Product Details Section
                    ProductDetailsSection(product: product),

                    // -- Product Rating & Review Section
                    ProductRatingReviewSection(product: product),

                    // -- Product You May Like Section
                    // const ProductYouMayLikeSection(),
                  ],
                ),
              ),
            ),
            // -- Bottom Bottons Section
            BottomBottonsWidget(
              firstButtonText: "Add to Cart",
              secondButtonText: "Buy Now",
              firstButtonOnTap: () {
                SnackBar snackBar = SnackBarUtils.mainSnackBar(context: context, content: "Item Added To Cart");
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              secondButtonOnTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
