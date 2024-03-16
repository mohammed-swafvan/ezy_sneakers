import 'package:ezy_sneakers/core/colors.dart';
import 'package:ezy_sneakers/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SearchAppBarWidget extends StatefulWidget {
  const SearchAppBarWidget({super.key});

  @override
  State<SearchAppBarWidget> createState() => _SearchAppBarWidgetState();
}

class _SearchAppBarWidgetState extends State<SearchAppBarWidget> {
  FocusNode focusNode = FocusNode();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(focusNode);
    });
    super.initState();
  }

  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: SafeArea(
        child: Padding(
          padding: kEdgeInsetsHoriz16,
          child: Center(
            child: TextFormField(
              onChanged: (value) {},
              controller: searchController,
              keyboardType: TextInputType.text,
              maxLines: 1,
              focusNode: focusNode,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                // -- Prefix Button
                prefixIcon: InkWell(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    Navigator.of(context).pop();
                  },
                  child: const Icon(
                    Iconsax.arrow_left,
                    size: 25,
                    color: Colors.black,
                  ),
                ),
                // -- Suffix Button
                suffixIcon: InkWell(
                  onTap: () {
                    setState(() {
                      searchController.clear();
                    });
                    FocusScope.of(context).unfocus();
                  },
                  child: const Icon(
                    Iconsax.close_circle,
                    size: 24,
                    color: kSubtitleColor,
                  ),
                ),

                filled: true,
                fillColor: Colors.transparent,
                focusedBorder: getInputBorder,
                enabledBorder: getInputBorder,
                border: getInputBorder,
                hintText: "Search Anything...",
                hintStyle: const TextStyle(
                  fontSize: 17,
                  color: kLightGrey,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Text Field Border Style
  OutlineInputBorder get getInputBorder {
    return OutlineInputBorder(
      borderRadius: kBorderRadius12,
      borderSide: const BorderSide(
        color: kLightGrey,
      ),
    );
  }
}
