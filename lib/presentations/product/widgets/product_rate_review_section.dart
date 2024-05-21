import 'package:get/get.dart';
import 'package:flutter/material.dart';

// -- Import app constant colors
import 'package:ezy_sneakers/core/colors.dart';

// -- Import app constants
import 'package:ezy_sneakers/core/constants.dart';

// -- Import app presentaion widgets
import 'package:ezy_sneakers/presentations/widgets/bordered_button_widget.dart';
import 'package:ezy_sneakers/presentations/widgets/section_view_more_widget.dart';
import 'package:ezy_sneakers/presentations/widgets/review_empty_card_widget.dart';
import 'package:ezy_sneakers/presentations/widgets/reivew_card_widget.dart';
import 'package:ezy_sneakers/presentations/rate_now/rate_now_screen.dart';

// -- Import app utils
import 'package:ezy_sneakers/presentations/utils/bottom_sheet_utils.dart';

class ProductRatingReviewSection extends StatelessWidget {
  const ProductRatingReviewSection({super.key, required this.product});
  final Map<String, dynamic> product;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> reviews = product['review'];
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
        color: kCardColor,
        borderRadius: kBorderRadius10,
        boxShadow: kCardShadow,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // -- Section Title
          const Padding(
            padding: kEdgeInsetsHoriz16,
            child: Text(
              "Ratings & Reviews",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          kHeight15,

          // -- Divider
          if (reviews.isNotEmpty)
            const Divider(
              color: kLightGrey,
            ),

          if (reviews.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // -- Product Rating Count
                  Text(
                    product['rating'],
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  const Text(
                    "/5",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: kSubtitleColor,
                    ),
                  ),
                  kWidth10,

                  // -- Product Overall Rating Count
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Overall Rating",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          "${product['overall_rating']} Ratings",
                          style: const TextStyle(
                            fontSize: 14,
                            color: kSubtitleColor,
                            fontWeight: FontWeight.w400,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // -- Rate Button
                  BorderedButtonWidget(
                    text: "Rate",
                    onTap: () {
                      Get.to(
                        () => RateNowScreen(product: product),
                        transition: Transition.fadeIn,
                      );
                    },
                  ),
                ],
              ),
            ),

          // -- Divider
          const Divider(
            color: kLightGrey,
          ),

          // -- Review Section
          if (reviews.isNotEmpty)
            ReviewCardWidget(
              review: reviews[0],
            ),

          if (reviews.isEmpty)
            ReviewEmptyCardWidget(
              onButtonTap: () {
                Get.to(
                  () => RateNowScreen(product: product),
                  transition: Transition.fadeIn,
                );
              },
            ),

          // Divider
          if (reviews.isNotEmpty)
            const Divider(
              color: kLightGrey,
            ),

          // -- Section View More Section
          if (reviews.isNotEmpty)
            SectionViewMoreWidget(
              title: "View All ${reviews.length.toString()} Reviews",
              onTap: () {
                BottomSheetUtils.productReviewBottomSheet(context, product['review']);
              },
            ),
        ],
      ),
    );
  }
}
