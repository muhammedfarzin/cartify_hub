import 'package:cartify_hub/presentation/widgets/counter_widget.dart';
import 'package:cartify_hub/presentation/widgets/grid_view_listing_widget.dart';
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
                child: CounterWidget(),
              ),
              // End of Product Count
            ],
          ),
          // End of Left Section
        ],
      ),
    );
  }
}
