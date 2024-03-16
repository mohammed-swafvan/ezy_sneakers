import 'package:ezy_sneakers/core/constants.dart';
import 'package:ezy_sneakers/presentations/search/widgets/search_appbar_widget.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    List<String> items = [
      "Men's Shoes",
      "Women's Shoes",
      "Kids's Shoes",
      "Running Shoes",
      "Casual Shoes",
      "Military Shoes",
    ];
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + 16),
        child: SearchAppBarWidget(),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          width: screenWidth,
          decoration: BoxDecoration(
            boxShadow: kCardShadow,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: items.map(
              (e) {
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  onTap: () {},
                  title: Text(e),
                );
              },
            ).toList(),
          ),
        ),
      ),
    );
  }
}
