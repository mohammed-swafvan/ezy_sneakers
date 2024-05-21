import 'package:flutter/material.dart';

// -- Import app presentaion widgets
import 'package:ezy_sneakers/presentations/widgets/rounded_image_widget.dart';

class ProductImagesBottomSection extends StatefulWidget {
  const ProductImagesBottomSection({super.key, required this.images, required this.imageIndex});
  final List<String> images;
  final int imageIndex;

  @override
  State<ProductImagesBottomSection> createState() => _ProductImagesBottomSectionState();
}

class _ProductImagesBottomSectionState extends State<ProductImagesBottomSection> {
  late int currentImageIndex;

  @override
  void initState() {
    setState(() {
      currentImageIndex = widget.imageIndex;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: screenWidth / 4,
      width: screenWidth,
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 16),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: widget.images.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(right: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () => currentImageIndex = index,
                  child: RoundedImageWidget(
                    image: widget.images[index],
                    imageWidth: screenWidth / 6,
                    imageHeight: screenWidth / 6,
                    radius: 4,
                  ),
                ),
                const Spacer(),
              ],
            ),
          );
        },
      ),
    );
  }
}
