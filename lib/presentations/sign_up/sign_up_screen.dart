import 'package:ezy_sneakers/core/colors.dart';
import 'package:ezy_sneakers/presentations/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          ListTile(
            leading: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const  Icon(
                Iconsax.arrow_left_24,
                color: kPrimaryColor,
              ),
            ),
            title: const Text(
              "Back",
              style: TextStyle(
                fontSize: 18,
                color: kPrimaryColor,
              ),
            ),
          ),
          Expanded(
            child: Container(),
          ),
        ],
      ),
    );
  }
}
