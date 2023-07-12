import 'package:cartify_hub/presentation/constants/widget_constants.dart';
import 'package:flutter/material.dart';

class ShippingFeeWidget extends StatelessWidget {
  const ShippingFeeWidget({
    super.key,
    required this.deliveryCharge,
  });

  final double deliveryCharge;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        Icon(
          Icons.local_shipping,
          color: colorScheme.primary,
          size: 20,
        ),
        WidgetConstants.width5,
        Text(
          deliveryCharge == 0
              ? "Free Shipping"
              : "+${deliveryCharge.floor()} Shipping Fee",
          style: TextStyle(color: colorScheme.primary),
        ),
      ],
    );
  }
}
