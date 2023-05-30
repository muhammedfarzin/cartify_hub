import 'package:cartify_hub/presentation/constants/font_weight_constants.dart';
import 'package:cartify_hub/presentation/main/widgets/bottom_navigation_bar_widget.dart';
import 'package:flutter/material.dart';

import 'widgets/offer_slider.dart';

class ScreenMain extends StatelessWidget {
  const ScreenMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App Bar
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          "Cartify Hub",
          style: TextStyle(
            fontWeight: FontWeightConstants.appBarTitle,
          ),
        ),
        actions: [
          IconButton.outlined(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton.outlined(
            onPressed: () {},
            icon: const Icon(Icons.favorite),
          ),
          IconButton.outlined(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      // End of App Bar

      body: const SafeArea(
        // Offer Slider
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: OfferSlider(),
        ),
        // End of Offer Slider
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: const BottomNavigationBarWidget(),
      // End of Bottom Navigation Bar
    );
  }
}