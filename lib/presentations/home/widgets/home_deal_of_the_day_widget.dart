import 'package:ezy_sneakers/core/colors.dart';
import 'package:ezy_sneakers/core/constants.dart';
import 'package:ezy_sneakers/presentations/widgets/deal_of_the_day_card_widget.dart';
import 'package:ezy_sneakers/presentations/widgets/section_header_widget.dart';
import 'package:flutter/material.dart';

class HomeDealOfTheDayWidget extends StatelessWidget {
  const HomeDealOfTheDayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // -- Section Header
          SectionHeaderWidget(
            sectionTitle: "Deal Of The Day",
            onViewAllTap: () {},
          ),

          Card(
            elevation: 6,
            shadowColor: kLightGrey,
            margin: kEdgeInsetsVert12,
            color: kCardColor,
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 10).copyWith(top: 18),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 8,
                mainAxisExtent: 224,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return const DealOfTheDayCardWidget();
              },
            ),
          ),
        ],
      ),
    );
  }
}
