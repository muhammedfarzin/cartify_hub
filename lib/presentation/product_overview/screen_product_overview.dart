import 'package:cartify_hub/functions/currency_format.dart';
import 'package:cartify_hub/presentation/constants/dummy_data.dart';
import 'package:cartify_hub/presentation/constants/icon_constants.dart';
import 'package:cartify_hub/presentation/favorite/screen_favorite.dart';
import 'package:cartify_hub/presentation/search/screen_search.dart';
import 'package:cartify_hub/presentation/widgets/price_discount_widget.dart';
import 'package:cartify_hub/presentation/widgets/shipping_fee_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ScreenProductOverview extends StatelessWidget {
  const ScreenProductOverview({
    super.key,
    this.id,
    required this.productData,
  });

  final dynamic id;
  final Product productData;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: colorScheme.inversePrimary,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: colorScheme.inversePrimary,
            floating: true,
            snap: true,
            actions: [
              // Search Button
              IconButton.outlined(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ScreenSearch(),
                      ));
                },
                icon: const Icon(Icons.search),
              ),

              // Favorite Button
              IconButton.outlined(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ScreenFavorite(),
                      ));
                },
                icon: const Icon(Icons.favorite),
              ),

              // Share Button
              IconButton.outlined(
                onPressed: () {},
                icon: const Icon(Icons.share),
              ),

              // Cart Button
              IconButton.outlined(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ScreenFavorite(),
                      ));
                },
                icon: Icon(IconConstants.cart),
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                height: screenSize.height * 2 - 90,
                decoration: BoxDecoration(
                  color: colorScheme.background,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  children: [
                    // Product Images
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Stack(
                        children: [
                          // Image Section
                          Container(
                            width: screenSize.width,
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                width: 1,
                                color:
                                    colorScheme.inversePrimary.withOpacity(0.5),
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image(
                                image: NetworkImage(productData.imageUrl),
                              ),
                            ),
                          ),

                          // Image Top Actions
                          Align(
                            alignment: Alignment.topRight,
                            child: Column(
                              children: [
                                IconButton.outlined(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.resolveWith(
                                              (states) => Colors.white)),
                                  icon: Icon(
                                    Icons.favorite,
                                    color: colorScheme.primary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // End of Product Images

                    // Product Details
                    Text(
                      productData.title,
                      style: textTheme.titleMedium,
                    ),

                    Row(
                      children: [
                        // Rating Bar
                        RatingBarIndicator(
                          rating: productData.starRating,
                          unratedColor: Colors.grey.shade300,
                          itemSize: 20,
                          itemCount: 5,
                          itemBuilder: (context, index) => Icon(
                            Icons.star_rate_rounded,
                            color: colorScheme.primary,
                          ),
                        ),
                        // Star Rating Count
                        Text(
                          "(${CurrencyFormat.formatNumber(productData.starRatingCount.toDouble())} ratings)",
                          style: textTheme.titleSmall
                              ?.copyWith(color: Colors.grey),
                        ),
                      ],
                    ),

                    // Price Details
                    PriceDiscountWidget(
                      price: productData.price,
                      offerRate: productData.offerRate,
                      priceFontSize: 16,
                      offerRateFontSize: 25,
                    ),
                    ShippingFeeWidget(
                        deliveryCharge: productData.deliveryCharge),
                    // End of Product Details
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
