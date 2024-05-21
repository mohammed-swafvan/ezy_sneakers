import 'package:flutter/material.dart';

// -- Import app constant colors
import 'package:ezy_sneakers/core/colors.dart';

// -- Import app constants
import 'package:ezy_sneakers/core/constants.dart';

// -- Import app presentation widgets
import 'package:ezy_sneakers/presentations/product/widgets/pin_code_success.dart';
import 'package:ezy_sneakers/presentations/product/widgets/pin_code_text_form_field_widget.dart';

class ProductDeliveryOptionsSection extends StatefulWidget {
  const ProductDeliveryOptionsSection({super.key});

  @override
  State<ProductDeliveryOptionsSection> createState() => _ProductDeliveryOptionsSectionState();
}

class _ProductDeliveryOptionsSectionState extends State<ProductDeliveryOptionsSection> {
  TextEditingController pinCodeController = TextEditingController();
  int pinCode = 0;
  bool showSuccessMessage = false;
  bool showInvalidMessage = false;
  bool showDeliverMethods = false;
  bool showEnterPinMessage = false;
  FocusNode focusNode = FocusNode();

  @override
  void dispose() {
    focusNode.unfocus();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      clearAll();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
      margin: const EdgeInsets.symmetric(vertical: 32, horizontal: 16).copyWith(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kCardColor,
        borderRadius: kBorderRadius10,
        boxShadow: kCardShadow,
      ),
      child: !showSuccessMessage
          ? // -- PIN Code Text Field
          PinCodeTextFormFieldWidget(
              focusNode: focusNode,
              pinCodeController: pinCodeController,
              showInvalidMessage: showInvalidMessage,
              showDeliverMethods: showDeliverMethods,
              showEnterPinMessage: showEnterPinMessage,
              onChanged: (value) {
                setState(() {
                  onUserTyping(value);
                });
              },
              onCheckButton: () {
                setState(() {
                  if (showInvalidMessage) {
                    clearAll();
                  } else {
                    onPinCodeCheck();
                  }
                });
              },
            )

          // PIN Code Succes Widget
          : PinCodeSuccess(
              pinCode: pinCode,
              showSuccessMessage: showSuccessMessage,
              onChangeButton: () {
                setState(() {
                  clearAll();
                });
              },
            ),
    );
  }

  void onPinCodeCheck() {
    if (pinCodeController.text.isEmpty) {
      showEnterPinMessage = true;
      showSuccessMessage = false;
      showInvalidMessage = false;
      showDeliverMethods = false;
      setState(() {});
      return;
    }

    pinCode = int.tryParse(pinCodeController.text) ?? 0;
    if (pinCode < 90000) {
      showInvalidMessage = true;
      showSuccessMessage = false;
      showDeliverMethods = false;
      setState(() {});
    } else {
      showSuccessMessage = true;
      showInvalidMessage = false;
      showDeliverMethods = false;
      setState(() {});
    }
  }

  void onUserTyping(String value) {
    if (value.isEmpty) {
      showDeliverMethods = false;
      showSuccessMessage = false;
      showInvalidMessage = false;
      showEnterPinMessage = false;
      setState(() {});
      return;
    }
    showDeliverMethods = true;
    showSuccessMessage = false;
    showInvalidMessage = false;
    showEnterPinMessage = false;
    setState(() {});
  }

  clearAll() {
    pinCodeController.clear();
    pinCode = 0;
    showSuccessMessage = false;
    showInvalidMessage = false;
    showEnterPinMessage = false;
    showDeliverMethods = false;
    setState(() {});
  }
}
