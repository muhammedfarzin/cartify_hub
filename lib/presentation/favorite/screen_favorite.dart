import 'package:cartify_hub/presentation/constants/dummy_data.dart';
import 'package:cartify_hub/presentation/widgets/grid_view_listing_widget.dart';
import 'package:flutter/material.dart';

class ScreenFavorite extends StatelessWidget {
  const ScreenFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Favorite"),
        actions: [
          IconButton.outlined(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton.outlined(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),

      // End of AppBar
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        children: [
          GridViewListingWidget(
            items: DummyData.topListingList,
            width: 150,
            showFavorite: true,
            isHome: false,
          ),
        ],
      ),
    );
  }
}
