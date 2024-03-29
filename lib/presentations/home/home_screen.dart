import 'package:ezy_sneakers/core/colors.dart';
import 'package:ezy_sneakers/presentations/home/widgets/home_app_bar.dart';
import 'package:ezy_sneakers/presentations/home/widgets/home_banner_widget.dart';
import 'package:ezy_sneakers/presentations/home/widgets/home_deal_of_the_day_widget.dart';
import 'package:ezy_sneakers/presentations/home/widgets/home_hot_selling_widget.dart';
import 'package:ezy_sneakers/presentations/home/widgets/home_recommended_for_you_widget.dart';
import 'package:ezy_sneakers/presentations/home/widgets/home_search_widget.dart';
import 'package:ezy_sneakers/presentations/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      drawer: const Drawer(),
      backgroundColor: kHomeScaffoldBgColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: HomeAppBar(
          onMenuButton: () {
            scaffoldKey.currentState!.openDrawer();
          },
          onNotificationButton: () {},
          onCartButton: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // -- Search Container Section
            HomeSearchWidget(
              onTap: () {
                Get.to(
                  () => const SearchScreen(),
                  transition: Transition.fadeIn,
                );
              },
            ),

            // -- Sliding Banner Section
            const HomeBannersWidget(),

            // -- Deal Of The Day Section
            const HomeDealOfTheDayWidget(),

            // -- Hot Selling Section
            const HomeHotSellingWidget(),

            // -- Recommended For You Section
            const RecommendedForYouWidget(),
          ],
        ),
      ),
    );
  }
}
