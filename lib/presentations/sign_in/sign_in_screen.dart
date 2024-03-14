import 'package:ezy_sneakers/core/colors.dart';
import 'package:ezy_sneakers/core/constants.dart';
import 'package:ezy_sneakers/presentations/bottom_nav/bottom_nav_screen.dart';
import 'package:ezy_sneakers/presentations/sign_up/sign_up_screen.dart';
import 'package:ezy_sneakers/presentations/welcome/welcome_screen.dart';
import 'package:ezy_sneakers/presentations/widgets/auth_header_tile_widget.dart';
import 'package:ezy_sneakers/presentations/widgets/auth_text_field_widget.dart';
import 'package:ezy_sneakers/presentations/widgets/custom_scaffold.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey formSignInKey = GlobalKey<FormState>();
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
            flex: 4,
            child: Container(
              padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 0.0),
              decoration: const BoxDecoration(
                color: kPrimaryColor,
                borderRadius: kBorderRadiusVert40,
              ),
              child: SingleChildScrollView(
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
                      kHeight50,
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
                      kHeight20,
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
                      kHeight05,
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {},
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: kSecondaryColor,
                            ),
                          ),
                        ),
                      ),
                      kHeight40,
                      SizedBox(
                        width: double.maxFinite,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.off(
                              () => const BottomNavScreen(),
                              transition: Transition.fadeIn,
                            );
                          },
                          child: const Text(
                            "Sign in",
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
                            "Don't have any Account?",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: kSubtitleColor,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.off(
                                () => const SignUpScreen(),
                                transition: Transition.fadeIn,
                              );
                            },
                            child: const Text(
                              " Sign Up",
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
