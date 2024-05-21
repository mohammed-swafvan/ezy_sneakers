import 'package:flutter/material.dart';

// -- Import app constant colors
import 'package:ezy_sneakers/core/colors.dart';

// -- Import app presentation widgets
import 'package:ezy_sneakers/presentations/widgets/rounded_image_widget.dart';
import 'package:ezy_sneakers/presentations/product_images/widgets/product_images_bottom_section.dart';

class ProductImagesScreen extends StatefulWidget {
  const ProductImagesScreen({super.key, required this.images, required this.initialIndex});
  final List<String> images;
  final int initialIndex;

  @override
  State<ProductImagesScreen> createState() => _ProductImagesScreenState();
}

class _ProductImagesScreenState extends State<ProductImagesScreen> {
  late int currentImageIndex;

  @override
  void initState() {
    setState(() {
      currentImageIndex = widget.initialIndex;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SizedBox(
        height: screenHeight,
        child: Column(
          children: [
            // -- Header Section
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.close,
                    size: 26,
                  ),
                ),
              ),
            ),

            // -- Body Section
            Expanded(
              child: Center(
                  child: RoundedImageWidget(
                    image: widget.images[currentImageIndex],
                    imageWidth: screenWidth / 1.1,
                    imageHeight: screenWidth / 1.1,
                    radius: 4,
                  ),
                ),
            ),

            // -- Bottom Section
            ProductImagesBottomSection(images: widget.images, imageIndex: currentImageIndex),
          ],
        ),
      ),
    );
  }
}
