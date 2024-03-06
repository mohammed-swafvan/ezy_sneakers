import 'package:ezy_sneakers/core/colors.dart';
import 'package:ezy_sneakers/core/constants.dart';
import 'package:flutter/material.dart';

class AuthTextFieldWidget extends StatelessWidget {
  const AuthTextFieldWidget({
    super.key,
    required this.validator,
    required this.labelText,
    required this.hintText,
    this.isObscuredText,
  });
  final Function(String?) validator;
  final String labelText;
  final String hintText;
  final bool? isObscuredText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => validator(value),
      obscureText: isObscuredText ?? false,
      obscuringCharacter: '•',
      decoration: InputDecoration(
        label: Text(labelText),
        labelStyle: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
        filled: true,
        fillColor: kSecondaryColor.withOpacity(0.05),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.black26,
        ),
        border: getTextFieldBorder,
        enabledBorder: getTextFieldBorder,
      ),
    );
  }

  OutlineInputBorder get getTextFieldBorder {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.black12,
      ),
      borderRadius: kBorderRadius10,
    );
  }
}
