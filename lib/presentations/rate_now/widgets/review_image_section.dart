import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

// -- Import app constant colors
import 'package:ezy_sneakers/core/colors.dart';

// -- Import app constants
import 'package:ezy_sneakers/core/constants.dart';

// -- Import app presentation widgets
import 'package:ezy_sneakers/presentations/widgets/rounded_image_widget.dart';

class ReviewImagesSection extends StatefulWidget {
  const ReviewImagesSection({super.key});

  @override
  State<ReviewImagesSection> createState() => _ReviewImagesSectionState();
}

class _ReviewImagesSectionState extends State<ReviewImagesSection> {
  List<String> reviewImages = [];
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(left: 18),
      child: SizedBox(
        child: Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  List<String> addedImages = reviewImages;
                  addedImages.add("assets/images/second_shirt_1.webp");

                  reviewImages = addedImages;
                });
              },
              child: Column(
                children: [
                  Container(
                    width: screenWidth / 11,
                    height: screenWidth / 11,
                    decoration: BoxDecoration(
                      borderRadius: kBorderRadius12,
                      border: Border.all(
                        color: kLightGrey,
                      ),
                    ),
                    child: const Center(
                      child: Icon(
                        Iconsax.gallery_add,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  kHeight05,
                  const Text(
                    "Add Photo",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 2,
                  ),
                ],
              ),
            ),

            // -- Added Review Images

            for (var i = 0; i < reviewImages.length; i++)
              Stack(
                children: [
                  RoundedImageWidget(
                    image: reviewImages[i],
                    imageWidth: screenWidth / 11,
                    imageHeight: screenWidth / 11,
                    radius: 8,
                  ),
                  Positioned(
                    top: 6,
                    right: 6,
                    child: InkWell(
                      onTap: () {
                        List<String> addedImages = reviewImages;
                        addedImages.removeAt(i);

                        reviewImages = addedImages;
                      },
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: kPrimaryColor.withOpacity(0.4),
                        ),
                        child: const Icon(
                          Icons.close,
                          size: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
