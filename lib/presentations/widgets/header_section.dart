import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

// -- Import app constats
import 'package:ezy_sneakers/core/constants.dart';

// -- Import app constant colors
import 'package:ezy_sneakers/core/colors.dart';

// -- Import app presentation utils widget
import 'package:ezy_sneakers/presentations/utils/snack_bar_utils.dart';

class HeaderSection extends StatefulWidget {
  const HeaderSection({
    super.key,
    this.title = "",
    required this.leadingIcon,
    required this.onLeadingButton,
    required this.actionIcons,
    required this.product,
    this.isProductScreen = false,
  });
  final IconData leadingIcon;
  final Function()? onLeadingButton;
  final String? title;
  final List<Map<String, dynamic>> actionIcons;
  final bool? isProductScreen;
  final Map<String, dynamic> product;

  @override
  State<HeaderSection> createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection> {
  List<int> wishedIds = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6).copyWith(top: 40),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        boxShadow: kCardShadow,
      ),
      child: Row(
        children: [
          // -- Menu Button
          IconButton(
            onPressed: widget.onLeadingButton,
            icon: Icon(
              widget.leadingIcon,
              size: 26,
            ),
          ),

          // -- Title
          Expanded(
            child: Text(
              widget.title ?? "",
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),

          // -- Icons
          for (int i = 0; i < widget.actionIcons.length; i++)
            buildActionIcons(
              onTap: widget.isProductScreen!
                  ? () async {
                      if (i == 0) {
                        if (wishedIds.contains(widget.product['id'])) {
                          setState(() {
                            wishedIds.remove(widget.product['id']);
                          });
                          SnackBar snackBar =
                              SnackBarUtils.mainSnackBar(context: context, content: "Item Removed From Favourite");
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else {
                          setState(() {
                            wishedIds.add(widget.product['id']);
                          });
                          SnackBar snackBar = SnackBarUtils.mainSnackBar(context: context, content: "Item Added To Favourite");
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      } else if (i == 1) {
                        XFile file = await assetToXFile(widget.product['images'][0]);
                        await Share.shareXFiles(
                          [file],
                          text: widget.product['product_name'],
                          subject: "${widget.product['offer']}% Offer",
                        );
                      }
                    }
                  : null,
              icon: widget.actionIcons[i]["icon"],
              iconColor:
                  widget.isProductScreen! && i == 0 && wishedIds.contains(widget.product['id']) ? kAlertColor : Colors.black,
              isNotificationIcon: widget.actionIcons[i]["notification"],
            ),
        ],
      ),
    );
  }

  Widget buildActionIcons({
    required IconData icon,
    required Color iconColor,
    required bool isNotificationIcon,
    VoidCallback? onTap,
  }) {
    return Stack(
      children: [
        IconButton(
          onPressed: onTap,
          icon: Icon(
            icon,
            size: 26,
            color: iconColor,
          ),
        ),
        if (isNotificationIcon)
          const Positioned(
            top: 10,
            right: 10,
            child: Icon(
              Icons.brightness_1,
              color: kAlertColor,
              size: 4,
            ),
          ),
      ],
    );
  }

  Future<XFile> assetToXFile(String assetName) async {
    ByteData data = await rootBundle.load(assetName);
    List<int> bytes = data.buffer.asUint8List();

    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;

    String tempFilePath = '$tempPath/${DateTime.now().millisecondsSinceEpoch}.png';
    File tempFile = File(tempFilePath);
    await tempFile.writeAsBytes(bytes);

    return XFile(tempFilePath);
  }
}
