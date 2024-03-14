import 'package:carousel_slider/carousel_slider.dart';
import 'package:ezy_sneakers/core/colors.dart';
import 'package:ezy_sneakers/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeBannersWidget extends StatefulWidget {
  const HomeBannersWidget({super.key});

  @override
  State<HomeBannersWidget> createState() => _HomeBannersWidgetState();
}

class _HomeBannersWidgetState extends State<HomeBannersWidget> {
  int carousalCurrentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      color: kCardColor,
      child: Column(
        children: [
          // -- Corousel Slider With Image
          CarouselSlider(
            items: kBanners
                .map(
                  (image) => buildImage(
                    screenWidth: screenWidth,
                    image: image,
                    onTap: () {},
                  ),
                )
                .toList(),
            options: CarouselOptions(
              viewportFraction: 1,
              onPageChanged: (index, _) {
                setState(() {
                  carousalCurrentIndex = index;
                });
              },
            ),
          ),
          // -- Sliding Dots
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 16),
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              direction: Axis.horizontal,
              children: [
                for (int i = 0; i < kBanners.length; i++)
                  Icon(
                    Icons.brightness_1,
                    size: 8,
                    color: carousalCurrentIndex == i ? kSecondaryColor : kLightGrey,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  InkWell buildImage({required double screenWidth, required String image, required VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: screenWidth,
        child: Image.asset(
          image,
          fit: BoxFit.cover,
          
        ),
      ),
    );
  }
}
