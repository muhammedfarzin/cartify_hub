import 'package:cartify_hub/functions/currency_format.dart';
import 'package:cartify_hub/presentation/constants/widget_constants.dart';
import 'package:cartify_hub/presentation/widgets/outlined_box_with_text.dart';
import 'package:cartify_hub/presentation/widgets/rounded_box_with_text.dart';
import 'package:flutter/material.dart';

class GridViewListingWidget extends StatelessWidget {
  final List<Product> items;
  final double width;
  final double childAspectRatio;
  final int? rowCount;
  const GridViewListingWidget({
    super.key,
    required this.items,
    this.width = 130,
    this.childAspectRatio = 1 / 1.55,
    this.rowCount,
  });

  @override
  Widget build(BuildContext context) {
    // bool showMore = false;
    final screenWidth = MediaQuery.of(context).size.width;
    final columnCount = screenWidth ~/ width;
    final itemCount = columnCount * (rowCount ?? 2);
    final selectedItemCount = (itemCount < items.length && rowCount != null)
        ? itemCount
        : items.length;

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
        if (selectedItemCount == index + 1 &&
            itemCount < items.length &&
            rowCount != null) {
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
                                color: Theme.of(context).colorScheme.background,
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

                          // Price
                          Text(
                            CurrencyFormat.formatCurrency(item.offerRate),
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          // End of Product Details
                        ],
                      ),

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

class Product {
  final String imageUrl;
  final String title;
  final String description;
  final double price;
  final double offerRate;
  final double deliveryCharge;

  Product({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.price,
    required this.offerRate,
    required this.deliveryCharge,
  });
}
