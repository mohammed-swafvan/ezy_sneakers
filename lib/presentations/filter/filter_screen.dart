import 'package:flutter/material.dart';

// -- Import app presentation widgets
import 'package:ezy_sneakers/presentations/filter/widgets/filter_body_section.dart';
import 'package:ezy_sneakers/presentations/filter/widgets/filter_header_section.dart';
import 'package:ezy_sneakers/presentations/widgets/bottom_botton_widget.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      initialization();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        height: screenHeight,
        child: Column(
          children: [
            // -- Header Section
            FilterHeaderSection(
              onBackButton: () {
                Navigator.of(context).pop();
              },
              onClearAllButton: () {},
            ),

            // -- Body Section
            const FilterBodySection(),

            // -- Bottom Bottons Section
            BottomBottonsWidget(
              firstButtonText: "Clear All",
              secondButtonText: "View 12 Results",
              firstButtonOnTap: () {
                // clearAll();
              },
            ),
          ],
        ),
      ),
    );
  }

  initialization() {}
}
