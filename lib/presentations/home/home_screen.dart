import 'package:ezy_sneakers/core/colors.dart';
import 'package:ezy_sneakers/presentations/home/widgets/home_app_bar.dart';
import 'package:flutter/material.dart';

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
      body: Container(),
    );
  }
}
