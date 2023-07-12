import 'package:cartify_hub/presentation/constants/dummy_data.dart';
import 'package:cartify_hub/presentation/constants/widget_constants.dart';
import 'package:cartify_hub/presentation/widgets/counter_widget.dart';
import 'package:cartify_hub/presentation/widgets/price_discount_widget.dart';
import 'package:cartify_hub/presentation/widgets/shipping_fee_widget.dart';
import 'package:flutter/material.dart';

class CartListItemWidget extends StatelessWidget {
  const CartListItemWidget({
    super.key,
    required this.item,
  });
  final Product item;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 3,
        horizontal: 7,
      ),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: colorScheme.inversePrimary.withOpacity(0.1),
        border: Border.all(
          color: colorScheme.primary,
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left Section
          Column(
            children: [
              // Product Image
              Container(
                width: 100,
                height: 100,
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(
                  item.imageUrl,
                  fit: BoxFit.contain,
                ),
              ),
              // End of Product Image

              // Product Count
              const SizedBox(
                width: 100,
                child: CounterWidget(isRemoveAtZero: true),
              ),
              // End of Product Count
            ],
          ),
          // End of Left Section

          WidgetConstants.width10,

          // Right Section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Item Title
                Text(
                  item.title,
                  style: Theme.of(context).textTheme.titleMedium,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),

                // Price Details
                PriceDiscountWidget(
                  price: item.price,
                  offerRate: item.offerRate,
                ),
                // End of Price Details

                // Shipping Fee
                ShippingFeeWidget(deliveryCharge: item.deliveryCharge),
                // End of Shipping Fee
                // Variants
                Column(
                  children: item.varient == null
                      ? []
                      : item.varient!.entries.map((variants) {
                          return Row(
                            children: [
                              Text(
                                "${variants.key}:",
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              WidgetConstants.width5,
                              Text(variants.value),
                            ],
                          );
                        }).toList(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
