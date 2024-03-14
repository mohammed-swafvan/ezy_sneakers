import 'package:ezy_sneakers/core/image_string.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

// Sized Box
const SizedBox kHeight05 = SizedBox(height: 05);
const SizedBox kHeight08 = SizedBox(height: 08);
const SizedBox kHeight10 = SizedBox(height: 10);
const SizedBox kHeight15 = SizedBox(height: 15);
const SizedBox kHeight20 = SizedBox(height: 20);
const SizedBox kHeight25 = SizedBox(height: 25);
const SizedBox kHeight30 = SizedBox(height: 30);
const SizedBox kHeight40 = SizedBox(height: 40);
const SizedBox kHeight50 = SizedBox(height: 50);
const SizedBox kWidth04 = SizedBox(width: 04);
const SizedBox kWidth10 = SizedBox(width: 10);

// -- Border Radius
final BorderRadius kBorderRadius04 = BorderRadius.circular(4);
final BorderRadius kBorderRadius10 = BorderRadius.circular(10);
final BorderRadius kBorderRadius12 = BorderRadius.circular(12);
const BorderRadius kBorderRadiusVert40 = BorderRadius.vertical(top: Radius.circular(40));

// -- Padding & Margin
const EdgeInsets kEdgeInsetsHoriz16 = EdgeInsets.symmetric(horizontal: 16);
const EdgeInsets kEdgeInsetsHoriz40 = EdgeInsets.symmetric(horizontal: 40);
const EdgeInsets kEdgeInsetsVert10 = EdgeInsets.symmetric(vertical: 10);
const EdgeInsets kEdgeInsetsVert12 = EdgeInsets.symmetric(vertical: 12);
const EdgeInsets kEdgeInsetsVert24 = EdgeInsets.symmetric(vertical: 24);

// -- Bottom Navigatio Bar Icons and Text
final List<Map<String, dynamic>> kBottomNavItems = [
  {
    "icon": Iconsax.home_15,
    "outlined_icon": Iconsax.home4,
    "text": "Home",
  },
  {
    "icon": Iconsax.category5,
    "outlined_icon": Iconsax.category,
    "text": "Categories",
  },
  {
    "icon": Iconsax.clock5,
    "outlined_icon": Iconsax.clock,
    "text": "Orders",
  },
  {
    "icon": Iconsax.profile_circle5,
    "outlined_icon": Iconsax.profile_circle,
    "text": "Profile",
  },
];
// -- Banners Image List
// -- Constant Lists
final List<String> kBanners = [
  ImageStrings.banner_1,
  ImageStrings.banner_2,
  ImageStrings.banner_3,
  ImageStrings.banner_4,
  ImageStrings.banner_5,
];