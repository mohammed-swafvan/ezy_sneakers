import 'package:ezy_sneakers/core/colors.dart';
import 'package:ezy_sneakers/core/constants.dart';
import 'package:ezy_sneakers/presentations/widgets/auth_text_field_widget.dart';
import 'package:ezy_sneakers/presentations/widgets/custom_scaffold.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey formSignInKey = GlobalKey<FormState>();
    return CustomScaffold(
      child: Column(
        children: [
          ListTile(
            leading: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Iconsax.arrow_left_2,
                  color: kPrimaryColor,
                  size: 20,
                ),
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
          const Expanded(
            flex: 1,
            child: SizedBox(),
          ),
          Expanded(
            flex: 8,
            child: Container(
              padding: kEdgeInsetsHoriz16,
              decoration: const BoxDecoration(
                color: kPrimaryColor,
                borderRadius: kBorderRadiusVert40,
              ),
              child: Form(
                key: formSignInKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Welcome Back",
                      style: TextStyle(
                        color: kSecondaryColor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    kHeight20,
                    AuthTextFieldWidget(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "email is required";
                        }
                        return null;
                      },
                      labelText: "email",
                      hintText: "Enter Your Email",
                    ),
                    kHeight10,
                    AuthTextFieldWidget(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "password is required";
                        }
                        return null;
                      },
                      labelText: "password",
                      hintText: "Enter Your Password",
                      isObscuredText: true,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
