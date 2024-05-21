import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

// -- Import app constant colors
import 'package:ezy_sneakers/core/colors.dart';

// -- Import app constants
import 'package:ezy_sneakers/core/constants.dart';

// -- Import app presentation widgets
import 'package:ezy_sneakers/presentations/widgets/rounded_image_widget.dart';

class ReviewCardWidget extends StatelessWidget {
  const ReviewCardWidget({super.key, required this.review});
  final Map<String, dynamic> review;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // -- Review Rating Bar
          RatingBar.builder(
            allowHalfRating: true,
            itemSize: 22,
            itemCount: 5,
            direction: Axis.horizontal,
            initialRating: review['review_rating'],
            unratedColor: kLightGrey,
            itemBuilder: (context, _) {
              return const Icon(
                Iconsax.star1,
                color: kRatingColor,
              );
            },
            onRatingUpdate: (onRating) {},
          ),
          kHeight08,

          // -- Review heading
          Text(
            review['review_heading'],
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w400,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          // -- Review Description
          Text(
            review['review_description'],
            style: const TextStyle(
              fontSize: 14,
              color: kSubtitleColor,
              fontWeight: FontWeight.w400,
              overflow: TextOverflow.ellipsis,
            ),
            maxLines: 3,
          ),
          kHeight08,

          // -- Review Images
          SizedBox(
            height: screenWidth / 9,
            width: screenWidth,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: review['review_images'].length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(right: 8),
                  child: InkWell(
                    onTap: () {},
                    child: RoundedImageWidget(
                      image: review['review_images'][index],
                      imageWidth: screenWidth / 9,
                      imageHeight: screenWidth / 9,
                      radius: 4,
                    ),
                  ),
                );
              },
            ),
          ),
          kHeight10,

          // -- Reviw Send By & Date
          Text(
            "${review['review_send_by']}, ${review['review_date']}",
            style: const TextStyle(
              fontSize: 13,
              color: kSubtitleColor,
              fontWeight: FontWeight.w500,
              overflow: TextOverflow.ellipsis,
            ),
            maxLines: 4,
          ),
        ],
      ),
    );
  }
}
