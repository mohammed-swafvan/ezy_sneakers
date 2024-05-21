import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

// -- Import app constant colors
import 'package:ezy_sneakers/core/colors.dart';

// -- Import app constants
import 'package:ezy_sneakers/core/constants.dart';

// -- Import presentation utilities
import 'package:ezy_sneakers/presentations/utils/bottom_sheet_utils.dart';

// -- Import app presentation widgets
import 'package:ezy_sneakers/presentations/rate_now/widgets/reivew_submit_button_widget.dart';
import 'package:ezy_sneakers/presentations/rate_now/widgets/review_text_field_widget.dart';
import 'package:ezy_sneakers/presentations/widgets/header_section.dart';
import 'package:ezy_sneakers/presentations/widgets/rounded_image_widget.dart';
import 'package:ezy_sneakers/presentations/rate_now/widgets/review_image_section.dart';

class RateNowScreen extends StatefulWidget {
  const RateNowScreen({super.key, required this.product});
  final Map<String, dynamic> product;

  @override
  State<RateNowScreen> createState() => _RateNowScreenState();
}

class _RateNowScreenState extends State<RateNowScreen> {
  TextEditingController reviewHeadingController = TextEditingController();
  TextEditingController reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.height;
    double rating = 0;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // -- Header Section
            HeaderSection(
              leadingIcon: Iconsax.arrow_left,
              title: "Write Review",
              onLeadingButton: () {
                Navigator.of(context).pop();
              },
              actionIcons: const [],
              product: const {},
            ),
            kHeight25,

            // -- Product Image Name Rating Bar
            Padding(
              padding: kEdgeInsetsHoriz16,
              child: Row(
                children: [
                  // -- Product Image
                  RoundedImageWidget(
                    image: widget.product['images'][0],
                    imageWidth: screenWidth / 11,
                    imageHeight: screenWidth / 11,
                    radius: 4,
                  ),
                  kWidth10,
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // -- Product Name
                        Text(
                          widget.product['product_name'],
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            overflow: TextOverflow.ellipsis,
                          ),
                          maxLines: 2,
                        ),

                        // Product Rating Bar
                        RatingBar.builder(
                          itemPadding: EdgeInsets.zero,
                          itemSize: 28,
                          itemCount: 5,
                          allowHalfRating: false,
                          direction: Axis.horizontal,
                          initialRating: rating,
                          unratedColor: kLightGrey,
                          itemBuilder: (context, _) {
                            return const Icon(
                              Iconsax.star1,
                              color: kRatingColor,
                            );
                          },
                          onRatingUpdate: (onRating) {
                            setState(() {
                              rating = onRating;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            kHeight25,

            // -- Heading For Review Section
            ReviewTextFieldWidget(
              controller: reviewHeadingController,
              label: "Heading of your review",
              maxLine: 1,
            ),
            kHeight10,

            // -- Write Review Section
            ReviewTextFieldWidget(
              controller: reviewController,
              label: "Write your review",
              maxLine: 5,
            ),
            kHeight25,

            // -- Add Review Image Section
            const ReviewImagesSection(),
            kHeight25,
            kHeight25,

            // -- Reivew Submit Button
            ReviewSubmitButtonWidget(
              text: "Submit Review",
              onTap: () {
                BottomSheetUtils.reviewSubmitSuccessBottomSheed(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
