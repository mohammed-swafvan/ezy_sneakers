import 'package:flutter/material.dart';

// -- Import app constant colors
import 'package:ezy_sneakers/core/colors.dart';

// -- Import app constants
import 'package:ezy_sneakers/core/constants.dart';

// -- Import app presentation widgets
import 'package:ezy_sneakers/presentations/widgets/rounded_image_widget.dart';

class OnlyLeftProductsWidget extends StatelessWidget {
  const OnlyLeftProductsWidget({super.key, required this.product});
  final Map<String, dynamic> product;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            // -- Product Color
            const Text(
              "Color: ",
              style: TextStyle(
                fontSize: 14,
                color: kLightGrey,
              ),
            ),
            Text(
              product['color'],
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            const Spacer(),

            // -- Product Left Count
            Text(
              "Only ${product['only_left'].length} Left",
              style: const TextStyle(
                fontSize: 13,
                color: kSubtitleColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        kHeight10,

        // -- Product Only Left Images
        SizedBox(
          height: screenWidth / 6,
          width: screenWidth,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: product['only_left'].length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(right: 10),
                child: InkWell(
                  onTap: () {},
                  child: RoundedImageWidget(
                    image: product['only_left'][index],
                    imageWidth: screenWidth / 6,
                    imageHeight: screenWidth / 6,
                    radius: 4,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}