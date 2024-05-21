import 'package:flutter/material.dart';

// -- Import app constant colors
import 'package:ezy_sneakers/core/colors.dart';

// -- Import app constants
import 'package:ezy_sneakers/core/constants.dart';

// -- Import app presentation widgts
import 'package:ezy_sneakers/presentations/widgets/bordered_button_widget.dart';
import 'package:ezy_sneakers/presentations/widgets/delevery_dispatch_method_widget.dart';

class PinCodeSuccess extends StatelessWidget {
  const PinCodeSuccess({
    super.key,
    required this.pinCode,
    required this.showSuccessMessage,
    required this.onChangeButton,
  });

  final int pinCode;
  final bool showSuccessMessage;
  final VoidCallback onChangeButton;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Deliver to",
                    style: TextStyle(
                      fontSize: 14,
                      color: kLightGrey,
                    ),
                  ),

                  // -- Place And PIN Code for Delivery
                  Text(
                    "Maine inglewood - ${pinCode.toString()}",
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),

            // -- PIN Code Change Button
            BorderedButtonWidget(
              text: "Change",
              onTap: onChangeButton,
            ),
          ],
        ),

        // -- Delivery Option Items
        if (showSuccessMessage)
          for (int i = 0; i < kDeliverOptionsIcons.length; i++)
            DeliveryDispatchMethodWidget(
              icon: kDeliverOptionsIcons[i],
              text: kDeliveyOptionsTitles[i],
            ),
      ],
    );
  }
}
