import 'package:ezy_sneakers/core/colors.dart';
import 'package:ezy_sneakers/core/constants.dart';
import 'package:ezy_sneakers/presentations/sign_in/sign_in_screen.dart';
import 'package:ezy_sneakers/presentations/sign_up/sign_up_screen.dart';
import 'package:ezy_sneakers/presentations/welcome/widgets/welcome_button.dart';
import 'package:ezy_sneakers/presentations/widgets/custom_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WelcomScreen extends StatelessWidget {
  const WelcomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          Expanded(
            child: Container(
              padding: kEdgeInsetsHoriz40,
              child: Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "Welcome Back!\n",
                        style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w600,
                          color: kPrimaryColor,
                        ),
                      ),
                      TextSpan(
                        text: "\nYour feet are tired of boring shoes.\nGive them the upgrade they deserve.",
                        style: TextStyle(
                          fontSize: 20,
                          color: kPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              const Expanded(
                child: WelcomeButton(
                  text: "Sign In",
                  navigateTo: SignInScreen(),
                  buttonColor: Colors.transparent,
                  textColor: kPrimaryColor,
                ),
              ),
              Expanded(
                child: WelcomeButton(
                  text: "Sign Up",
                  navigateTo: const SignUpScreen(),
                  buttonColor: kPrimaryColor.withOpacity(0.8),
                  textColor: kSecondaryColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
