import 'package:cartify_hub/functions/currency_format.dart';
import 'package:cartify_hub/presentation/constants/dummy_data.dart';
import 'package:cartify_hub/presentation/constants/widget_constants.dart';
import 'package:cartify_hub/presentation/widgets/outlined_box_with_text.dart';
import 'package:cartify_hub/presentation/widgets/rounded_box_with_text.dart';
import 'package:flutter/material.dart';

class GridViewListingWidget extends StatelessWidget {
  final List<Product> items;
  final double width;
  final double childAspectRatio;
  final int? rowCount;
  final bool showFavorite;
  final bool isHome;
  const GridViewListingWidget({
    super.key,
    required this.items,
    this.width = 130,
    this.childAspectRatio = 1 / 1.55,
    this.rowCount,
    this.showFavorite = false,
    this.isHome = true,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final columnCount = screenWidth ~/ width;
    final itemCount = columnCount * (rowCount ?? 2);
    final selectedItemCount = (itemCount < items.length && rowCount != null)
        ? itemCount
        : items.length;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return GridView.builder(
      itemCount: selectedItemCount,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columnCount,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) {
        final item = items[index];
        // Checking Show more or not
        if (rowCount != null &&
            selectedItemCount == index + 1 &&
            itemCount < items.length) {
          // Show More Element
          return const Card(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: OutlinedBoxWithText(
                    text: "Show More",
                  ),
                ),
              ),
            ),
          );
          // End of Show More Element
        } else {
          return LayoutBuilder(
            builder: (context, constraints) {
              final maxWidth = constraints.maxWidth;
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Product Image
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: Container(
                                color: Colors.white,
                                padding: const EdgeInsets.all(5),
                                child: Image(
                                  image: NetworkImage(item.imageUrl),
                                  width: double.infinity,
                                ),
                              ),
                            ),
                          ),
                          // End of Product Image

                          WidgetConstants.height5,

                          // Product Details
                          // Title
                          Text(
                            item.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),

                          // Price Details
                          if (isHome == true)
                            Text(
                              CurrencyFormat.formatCurrency(item.offerRate),
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          else
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    // Actual Price
                                    Text(
                                      CurrencyFormat.formatCurrency(item.price),
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
                                      CurrencyFormat.formatCurrency(
                                          item.offerRate),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                              color: colorScheme.primary),
                                    ),
                                    WidgetConstants.width10,
                                  ],
                                ),

                                // Shipping
                                item.deliveryCharge == 0
                                    ? Row(
                                        children: [
                                          Icon(
                                            Icons.local_shipping,
                                            color: colorScheme.primary,
                                            size: 20,
                                          ),
                                          WidgetConstants.width5,
                                          Text(
                                            item.deliveryCharge == 0
                                                ? "Free Shipping"
                                                : "+${CurrencyFormat.formatCurrency(item.deliveryCharge)} Shipping Fee",
                                            style: TextStyle(
                                                color: colorScheme.primary),
                                          ),
                                        ],
                                      )
                                    : Text(
                                        "+${item.deliveryCharge.floor()} Shipping fee",
                                        style: const TextStyle(fontSize: 12),
                                      ),
                              ],
                            ),
                          // End of Price Details
                          // End of Product Details
                        ],
                      ),

                      // Favorite Button
                      if (showFavorite == true)
                        Positioned(
                          top: 0,
                          right: 0,
                          child: IconButton.outlined(
                              color: colorScheme.primary,
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          colorScheme.background)),
                              onPressed: () {},
                              icon: const Icon(Icons.favorite)),
                        ),
                      // End of Favorite Button

                      // Discount Rate
                      Positioned(
                        top: maxWidth - 40,
                        right: 0,
                        child: RoundedBoxWithText(
                            text:
                                "${CurrencyFormat.getPercentage(originalPrice: item.price, offerPrice: item.offerRate)}% off"),
                      ),
                      // End of Discount Rate
                    ],
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
