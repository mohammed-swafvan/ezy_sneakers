import 'package:flutter/material.dart';

// -- Import app constant colors
import 'package:ezy_sneakers/core/colors.dart';

// -- Import app constants
import 'package:ezy_sneakers/core/constants.dart';

class FilterBodySection extends StatefulWidget {
  const FilterBodySection({super.key});

  @override
  State<FilterBodySection> createState() => _FilterBodySectionState();
}

class _FilterBodySectionState extends State<FilterBodySection> {
  int currentIndex = 0;
  List<Map<String, dynamic>> filterItems = [];

  @override
  void initState() {
    showFilterItems(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Expanded(
      child: Row(
        children: [
          SizedBox(
            width: screenWidth / 3,
            child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: kFilterOptions.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      setState(() {
                        currentIndex = index;
                        showFilterItems(index);
                      });
                    },
                    selected: currentIndex == index,
                    selectedTileColor: kLightGrey,
                    style: ListTileStyle.list,
                    title: Text(
                      kFilterOptions[index],
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  );
                }),
          ),
          Expanded(
            child: Container(
              color: kPrimaryColor,
              child: filterItems.isEmpty
                  ? const Center(
                      child: Text("No Items"),
                    )
                  : ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: filterItems.length,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Checkbox(
                             activeColor: kSecondaryColor,
                              value: filterItems[index]["is_selected"],
                              onChanged: (value) {
                                selectItem(index);
                              },
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(4),
                                ),
                              ),
                              side: const BorderSide(
                                color: kLightGrey,
                                width: 1,
                              ),
                              visualDensity: const VisualDensity(vertical: 2),
                            ),
                            Expanded(
                              child: Text(
                                filterItems[index]["item_name"],
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }

  void showFilterItems(int index) {
    filterItems = [];
    setState(() {});
    switch (index) {
      case 0:
        filterItems = kFilterBrand;
        break;
      case 1:
        filterItems = kFilterSize;
        break;
      case 2:
        filterItems = kFilterCategory;
        break;
      case 3:
        filterItems = kFilterBundle;
        break;
      case 4:
        filterItems = kFilterPriceRange;
        break;
      case 5:
        filterItems = kFilterDiscount;
        break;
      case 6:
        filterItems = kFilterRating;
        break;
      case 7:
        filterItems = kFilterPattern;
        break;
      case 8:
        filterItems = kFilterSleeveLength;
        break;
      case 9:
        filterItems = [];
        break;
      case 10:
        filterItems = kFilterFit;
        break;
    }
    setState(() {});
  }

  void selectItem(int index) {
    switch (currentIndex) {
      case 0:
        kFilterBrand[index]["is_selected"] = !kFilterBrand[index]["is_selected"];
        break;
      case 1:
        kFilterSize[index]["is_selected"] = !kFilterSize[index]["is_selected"];
        break;
      case 2:
        kFilterCategory[index]["is_selected"] = !kFilterCategory[index]["is_selected"];
        break;
      case 3:
        kFilterBundle[index]["is_selected"] = !kFilterBundle[index]["is_selected"];
        break;
      case 4:
        kFilterPriceRange[index]["is_selected"] = !kFilterPriceRange[index]["is_selected"];
        break;
      case 5:
        kFilterDiscount[index]["is_selected"] = !kFilterDiscount[index]["is_selected"];
        break;
      case 6:
        kFilterRating[index]["is_selected"] = !kFilterRating[index]["is_selected"];
        break;
      case 7:
        kFilterPattern[index]["is_selected"] = !kFilterPattern[index]["is_selected"];
        break;
      case 8:
        kFilterSleeveLength[index]["is_selected"] = !kFilterSleeveLength[index]["is_selected"];
        break;
      case 10:
        kFilterFit[index]["is_selected"] = !kFilterFit[index]["is_selected"];
        break;
    }
    setState(() {});
  }
}
