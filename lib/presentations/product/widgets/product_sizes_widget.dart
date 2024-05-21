import 'package:flutter/material.dart';

// -- Import app constant colors
import 'package:ezy_sneakers/core/colors.dart';

// -- Import app constants
import 'package:ezy_sneakers/core/constants.dart';

class ProductSizesWidget extends StatefulWidget {
  const ProductSizesWidget({super.key, required this.sizes});
  final List<Map<String, dynamic>> sizes;

  @override
  State<ProductSizesWidget> createState() => _ProductSizesWidgetState();
}

class _ProductSizesWidgetState extends State<ProductSizesWidget> {
   int currentSizeBoxIndex = 0;
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // -- Product Sizes Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Size",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            InkWell(
              onTap: () {},
              child: const Text(
                "Size Chart",
                style: TextStyle(
                  fontSize: 13,
                  color: kSubtitleColor,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                  decorationColor: kSubtitleColor,
                ),
              ),
            ),
          ],
        ),
        kHeight10,

        // -- Product Sizes
        SizedBox(
          height: screenWidth / 10.5,
          width: screenWidth,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: widget.sizes.length,
            itemBuilder: (context, index) {
              final Map<String, dynamic> size = widget.sizes[index];
              return Container(
                margin: const EdgeInsets.only(right: 10),
                child: InkWell(
                  onTap: !size["out_of_stock"]
                      ? () {
                          setState(() {
                            currentSizeBoxIndex = index;
                          });
                        }
                      : null,
                  child: Container(
                    height: screenWidth / 10.5,
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    decoration: boxDecoration(
                      size["out_of_stock"],
                      currentSizeBoxIndex == index,
                    ),
                    child: Center(
                      child: Text(
                        size["size"],
                        style: TextStyle(
                          color: size["out_of_stock"]
                              ? kLightGrey
                              : currentSizeBoxIndex == index
                                  ? kPrimaryColor
                                  : Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  BoxDecoration boxDecoration(bool outOfStck, bool isSelected) {
    if (outOfStck) {
      return BoxDecoration(
        color: kScaffoldBgColor,
        borderRadius: kBorderRadius06,
        border: Border.all(
          color: kLightGrey,
        ),
      );
    }
    if (isSelected) {
      return BoxDecoration(
        color: kSecondaryColor,
        borderRadius: kBorderRadius06,
      );
    }
    return BoxDecoration(
      color: kSecondaryColor.withOpacity(0.1),
      borderRadius: kBorderRadius06,
      border: Border.all(
        color: kLightGrey,
      ),
    );
  }
}
