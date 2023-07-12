import 'package:cartify_hub/functions/currency_format.dart';
import 'package:cartify_hub/presentation/constants/widget_constants.dart';
import 'package:flutter/material.dart';

class PriceDiscountWidget extends StatelessWidget {
  const PriceDiscountWidget({
    super.key,
    required this.price,
    required this.offerRate,
    this.showPercentage = true,
  });

  final double price;
  final double offerRate;
  final bool showPercentage;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Row(
      children: [
        // Actual Price
        Text(
          CurrencyFormat.formatCurrency(price),
          style: TextStyle(
            fontSize: 12,
            decoration: TextDecoration.lineThrough,
            color: Colors.grey.shade700,
            decorationColor: Colors.grey.shade700,
          ),
        ),
        WidgetConstants.width5,

        // Offer Price
        Text(
          CurrencyFormat.formatCurrency(offerRate),
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: colorScheme.primary),
        ),
        WidgetConstants.width10,

        // Discount Percentage
        if (showPercentage)
          Container(
            padding: const EdgeInsets.all(2),
            // Border
            decoration: BoxDecoration(
                border: Border.all(width: 0.5, color: colorScheme.primary),
                borderRadius: BorderRadius.circular(5)),
            child: Text(
              "${CurrencyFormat.getPercentage(originalPrice: price, offerPrice: offerRate)}% OFF",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: colorScheme.primary),
            ),
          ),
      ],
    );
  }
}
