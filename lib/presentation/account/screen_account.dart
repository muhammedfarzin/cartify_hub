import 'package:cartify_hub/presentation/constants/asset_images.dart';
import 'package:cartify_hub/presentation/constants/widget_constants.dart';
import 'package:cartify_hub/presentation/widgets/outlined_box_with_text.dart';
import 'package:flutter/material.dart';

class ScreenAccount extends StatelessWidget {
  const ScreenAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final orderColumnCount = screenWidth ~/ 320;
    return ListView(
      children: [
        // User Profile
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        border: Border.all(width: 0.5),
                        borderRadius: BorderRadius.circular(100)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        AssetImages.profileAvatar,
                        width: 110,
                        height: 110,
                      ),
                    ),
                  ),

                  // Edit Button
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(100)),
                      child: const Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  // End of Edit Button
                ],
              ),
              WidgetConstants.width10,
              Text(
                "Hey, Username",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
        // End of User Profile

        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: screenWidth * 0.1, vertical: 10),
          child: WidgetConstants.lineHeight1,
        ),

        // Orders
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Your Orders",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              WidgetConstants.height5,
              // Order List View
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: orderColumnCount,
                  childAspectRatio: 3,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .inversePrimary
                          .withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 0.5,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Product Image
                          AspectRatio(
                            aspectRatio: 1,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                padding: const EdgeInsets.all(3),
                                height: double.infinity,
                                color: Colors.white,
                                child: Image.network(
                                  "https://img3.gadgetsnow.com/gd/images/products/additional/large/G390864_View_1/mobiles/smartphones/apple-iphone-14-pro-max-512-gb-deep-purple-6-gb-ram-.jpg",
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                          // End of Product Image

                          WidgetConstants.width10,

                          // Order Details
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Product Title
                                Text(
                                  "Apple iPhone 14 Pro Max 512 GB (Deep Purple, 6 GB RAM)",
                                  maxLines: 2,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                  overflow: TextOverflow.ellipsis,
                                ),

                                // Delivery Status
                                const Align(
                                  alignment: Alignment.bottomRight,
                                  child: OutlinedBoxWithText(
                                    text: "Delivered on June 5, 2023",
                                    textSize: 15,
                                  ),
                                )
                              ],
                            ),
                          )
                          // End of Order Details
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        )
        // End of Orders
      ],
    );
  }
}
