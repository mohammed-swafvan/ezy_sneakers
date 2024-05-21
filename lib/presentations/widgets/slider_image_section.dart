import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

// -- Import app constant colors
import 'package:ezy_sneakers/core/colors.dart';

class SliderImageSection extends StatefulWidget {
  const SliderImageSection({
    super.key,
    required this.images,
    required this.imageOnTap,
  });
  final List<String> images;
  final Function(int) imageOnTap;

  @override
  State<SliderImageSection> createState() => _SliderImageSectionState();
}

class _SliderImageSectionState extends State<SliderImageSection> {
  @override
  Widget build(BuildContext context) {
    int carouselCurrentIndex = 0;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // -- Carousel Slider With Image
        CarouselSlider(
          items: [
            for (int i = 0; i < widget.images.length; i++)
              InkWell(
                onTap: () => widget.imageOnTap(i),
                child: buildImage(
                  screenWidth: screenWidth,
                  image: widget.images[i],
                ),
              ),
          ],
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, _) {
              setState(() {
                carouselCurrentIndex = index;
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
              for (int i = 0; i < widget.images.length; i++)
                Icon(
                  Icons.brightness_1,
                  size: 8,
                  color: carouselCurrentIndex == i ? kSubtitleColor : kLightGrey.withOpacity(0.5),
                ),
            ],
          ),
        ),
      ],
    );
  }

  SizedBox buildImage({required double screenWidth, required String image}) {
    return SizedBox(
      width: screenWidth,
      child: Image.asset(
        image,
        fit: BoxFit.cover,
      ),
    );
  }
}
