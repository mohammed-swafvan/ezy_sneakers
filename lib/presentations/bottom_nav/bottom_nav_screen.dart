import 'package:ezy_sneakers/core/colors.dart';
import 'package:ezy_sneakers/core/constants.dart';
import 'package:ezy_sneakers/presentations/home/home_screen.dart';
import 'package:flutter/material.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNavScreen> {
  int currentIndex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        backgroundColor: kPrimaryColor,
        selectedItemColor: kSecondaryColor,
        unselectedItemColor: kSubtitleColor,
        selectedLabelStyle: const TextStyle(color: kSecondaryColor),
        unselectedLabelStyle: const TextStyle(color: kSubtitleColor),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        iconSize: 28,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
        items: [
          // Bottom Navigation Items
          for (int i = 0; i < kBottomNavItems.length; i++)
            buildMainScreenItem(
              pageIndex: i,
              currentPageIndex: currentIndex,
              item: kBottomNavItems[i],
            ),
        ],
      ),
    );
  }

  BottomNavigationBarItem buildMainScreenItem({
    required int pageIndex,
    required int currentPageIndex,
    required Map<String, dynamic> item,
  }) {
    return BottomNavigationBarItem(
      icon: Icon(
        currentPageIndex == pageIndex ? item["icon"] : item["outlined_icon"],
      ),
      label: item["text"],
    );
  }
}
