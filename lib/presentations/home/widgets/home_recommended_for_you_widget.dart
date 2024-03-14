import 'package:ezy_sneakers/core/colors.dart';
import 'package:ezy_sneakers/core/constants.dart';
import 'package:ezy_sneakers/presentations/widgets/product_card_widget.dart';
import 'package:ezy_sneakers/presentations/widgets/section_header_widget.dart';
import 'package:flutter/material.dart';

class RecommendedForYouWidget extends StatelessWidget {
  const RecommendedForYouWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.only(top: 16, bottom: 6),
      color: kCardColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // -- Section Header
          Padding(
            padding: kEdgeInsetsHoriz16,
            child: SectionHeaderWidget(
              sectionTitle: "Recommended for you",
              onViewAllTap: () {},
            ),
          ),

          Container(
            margin: kEdgeInsetsVert12,
            height: screenHeight / 3.6,
            width: screenWidth,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: 6,
              itemBuilder: (context, index) {
                return ProductCardWidget(imageWidth: screenWidth / 2.4);
              },
              separatorBuilder: (context, index) => kWidth10,
            ),
          ),
        ],
      ),
    );
  }
}
