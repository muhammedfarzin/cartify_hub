import 'package:cartify_hub/presentation/cart/widgets/cart_list_item_widget.dart';
import 'package:cartify_hub/presentation/constants/dummy_data.dart';
import 'package:cartify_hub/presentation/constants/widget_constants.dart';
import 'package:cartify_hub/presentation/favorite/screen_favorite.dart';
import 'package:cartify_hub/presentation/search/screen_search.dart';
import 'package:flutter/material.dart';

class ScreenCart extends StatelessWidget {
  const ScreenCart({
    super.key,
    this.showAppBar = false,
  });
  final bool showAppBar;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: showAppBar
          ? AppBar(
              backgroundColor: colorScheme.inversePrimary,
              title: const Text(
                "Cart",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
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

                // More Button
                IconButton.outlined(
                  onPressed: () {},
                  icon: const Icon(Icons.more_vert),
                ),
              ],
            )
          : null,
      body: SafeArea(
        child: Column(
          children: [
            // Top Section (ListView)
            Expanded(
              child: ListView(
                children: [
                  // Address Section
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: colorScheme.inversePrimary.withOpacity(0.2),
                        border: Border.all(
                          color: colorScheme.inversePrimary,
                        ),
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(50),
                        )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Deliver to this address",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: colorScheme.primary,
                          ),
                        ),
                        const Text(
                          "4567 Green Avenue Mumbai, Maharashtra - 400001",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                  // End of Address Section

                  WidgetConstants.height5,

                  // Cart List
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: DummyData.topListingList.length,
                    itemBuilder: (context, index) {
                      final item = DummyData.topListingList[index];
                      return CartListItemWidget(item: item);
                    },
                  )
                  // End of Cart List
                ],
              ),
            ),
            // End of Top Section (ListView)

            // Bottom Section
            Container(
              padding: const EdgeInsets.all(10),

              // Box Decoration
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.inversePrimary,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
                border: Border.all(
                    color: Theme.of(context).colorScheme.primary, width: 0.5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Price Section
                  Column(
                    children: [
                      const Text(
                        "₹1,999",
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Price details",
                        style: TextStyle(
                          fontSize: 13,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),

                  // Proceed Button
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Proceed"),
                  ),
                ],
              ),
            ),
            // End of Bottom Section
          ],
        ),
      ),
    );
  }
}
