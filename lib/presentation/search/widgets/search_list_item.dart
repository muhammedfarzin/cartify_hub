import 'package:cartify_hub/functions/currency_format.dart';
import 'package:cartify_hub/presentation/constants/dummy_data.dart';
import 'package:cartify_hub/presentation/constants/widget_constants.dart';
import 'package:cartify_hub/presentation/widgets/price_discount_widget.dart';
import 'package:cartify_hub/presentation/widgets/shipping_fee_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class SearchListItem extends StatelessWidget {
  const SearchListItem({
    super.key,
    required this.item,
  });

  final Product item;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Size screenSize = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: colorScheme.inversePrimary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 0.5,
          color: colorScheme.primary,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          Container(
            width: screenSize.width * 0.25,
            height: screenSize.width * 0.25,
            padding: const EdgeInsets.all(3),
            constraints: const BoxConstraints(
              minWidth: 120,
              minHeight: 120,
              maxWidth: 200,
              maxHeight: 200,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 1,
                color: colorScheme.inversePrimary.withOpacity(0.5),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(item.imageUrl),
            ),
          ),
          // End of Product Image

          WidgetConstants.width5,

          // Product Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  item.title,
                  style: textTheme.titleMedium,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                // Rating
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Rating
                    Text(
                      "${item.starRating}",
                      style: textTheme.titleSmall
                          ?.copyWith(color: colorScheme.primary),
                    ),
                    // Rating Bar
                    RatingBarIndicator(
                      rating: item.starRating,
                      itemSize: 20,
                      itemCount: 5,
                      itemBuilder: (context, index) => Icon(
                        Icons.star_rate_rounded,
                        color: colorScheme.primary,
                      ),
                    ),
                    // Star Rating Count
                    Text(
                      "(${CurrencyFormat.formatNumber(item.starRatingCount.toDouble())})",
                      style: textTheme.titleSmall?.copyWith(color: Colors.grey),
                    )
                  ],
                ),
                // End of Rating
                // Price Details
                PriceDiscountWidget(
                  price: item.price,
                  offerRate: item.offerRate,
                ),
                ShippingFeeWidget(deliveryCharge: item.deliveryCharge),
                // Price Details
              ],
            ),
          )
          // End of Product Details
        ],
      ),
    );
  }
}
