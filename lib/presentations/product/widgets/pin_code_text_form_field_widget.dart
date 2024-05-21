import 'package:ezy_sneakers/presentations/widgets/delivery_dispatch_method_widget.dart';
import 'package:flutter/material.dart';

// -- Import app constant colors
import 'package:ezy_sneakers/core/colors.dart';

// -- Import app constants
import 'package:ezy_sneakers/core/constants.dart';

// -- Import app presentation widgets

class PinCodeTextFormFieldWidget extends StatefulWidget {
  const PinCodeTextFormFieldWidget({
    super.key,
    required this.focusNode,
    required this.pinCodeController,
    required this.showInvalidMessage,
    required this.showDeliverMethods,
    required this.showEnterPinMessage,
    required this.onChanged,
    required this.onCheckButton,
  });
  final bool showInvalidMessage;
  final bool showDeliverMethods;
  final bool showEnterPinMessage;
  final FocusNode focusNode;
  final TextEditingController pinCodeController;
  final Function(String value) onChanged;
  final VoidCallback onCheckButton;

  @override
  State<PinCodeTextFormFieldWidget> createState() => _PinCodeTextFormFieldWidgetState();
}

class _PinCodeTextFormFieldWidgetState extends State<PinCodeTextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Delivery Options",
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        kHeight10,

        // -- PIN Code Text Field
        TextFormField(
          focusNode: widget.focusNode,
          controller: widget.pinCodeController,
          onChanged: widget.onChanged,
          keyboardType: TextInputType.number,
          maxLines: 1,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 14,
            ),

            // -- Suffix Button
            suffixIcon: Container(
              padding: const EdgeInsets.all(14),
              child: InkWell(
                onTap: widget.onCheckButton,
                child: Text(
                  widget.showInvalidMessage ? "CHANGE" : "CHECK",
                  style: const TextStyle(
                    fontSize: 12,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),

            filled: true,
            fillColor: Colors.transparent,
            focusedBorder: getInputBorder,
            enabledBorder: getInputBorder,
            border: getInputBorder,
            hintText: "Enter PIN Code",
            hintStyle: const TextStyle(
              fontSize: 15,
              color: kLightGrey,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        kHeight08,

        // -- Error Messages
        if (widget.showInvalidMessage) errorText("Sorry! Currently We don't ship to this pin code"),
        if (widget.showEnterPinMessage) errorText("Please Enter Your PIN Code"),

        // -- Delivery Dispatch Methods
        if (widget.showDeliverMethods)
          for (int i = 0; i < kDeliverOptionsIcons.length; i++)
            DeliveryDispatchMethodWidget(
              icon: kDeliverOptionsIcons[i],
              text: kDeliveyOptionsTitles[i],
            ),
      ],
    );
  }

  // -- Text Field Border Style
  OutlineInputBorder get getInputBorder {
    return OutlineInputBorder(
      borderRadius: kBorderRadius12,
      borderSide: const BorderSide(
        color: kLightGrey,
      ),
    );
  }

  // -- Error Text
  Text errorText(String errorText) {
    return Text(
      errorText,
      style: const TextStyle(
        color: Colors.red,
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
