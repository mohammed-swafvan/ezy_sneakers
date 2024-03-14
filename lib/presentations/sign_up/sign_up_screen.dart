import 'package:ezy_sneakers/core/colors.dart';
import 'package:ezy_sneakers/core/constants.dart';
import 'package:ezy_sneakers/presentations/bottom_nav/bottom_nav_screen.dart';
import 'package:ezy_sneakers/presentations/sign_in/sign_in_screen.dart';
import 'package:ezy_sneakers/presentations/welcome/welcome_screen.dart';
import 'package:ezy_sneakers/presentations/widgets/auth_header_tile_widget.dart';
import 'package:ezy_sneakers/presentations/widgets/auth_text_field_widget.dart';
import 'package:ezy_sneakers/presentations/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey formSignUpKey = GlobalKey<FormState>();
    return CustomScaffold(
      child: Column(
        children: [
          AuthHeaderTileWidget(
            onTap: () {
              Get.off(
                () => const WelcomScreen(),
                transition: Transition.fadeIn,
              );
            },
          ),
          const Expanded(
            flex: 1,
            child: SizedBox(),
          ),
          Expanded(
            flex: 8,
            child: Container(
              padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 0.0),
              decoration: const BoxDecoration(
                color: kPrimaryColor,
                borderRadius: kBorderRadiusVert40,
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: formSignUpKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Get Started",
                        style: TextStyle(
                          color: kSecondaryColor,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      kHeight40,
                      AuthTextFieldWidget(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "full name is required";
                          }
                          return null;
                        },
                        labelText: "full name",
                        hintText: "Enter Your Full Name",
                      ),
                      kHeight15,
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
                      kHeight15,
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
                      kHeight15,
                      AuthTextFieldWidget(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "confirm password is required";
                          }
                          return null;
                        },
                        labelText: "confirm password",
                        hintText: "Enter Your Confirm Password",
                        isObscuredText: true,
                      ),
                      kHeight40,
                      SizedBox(
                        width: double.maxFinite,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.off(
                              () => const BottomNavScreen(),
                            );
                          },
                          child: const Text(
                            "Sign up",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      kHeight40,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already have an Account?",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: kSubtitleColor,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.off(
                                () => const SignInScreen(),
                                transition: Transition.fadeIn,
                              );
                            },
                            child: const Text(
                              " Sign In",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: kSecondaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
