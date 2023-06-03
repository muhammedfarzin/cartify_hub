import 'package:cartify_hub/presentation/constants/dummy_data.dart';
import 'package:cartify_hub/presentation/main/widgets/offer_slider.dart';
import 'package:cartify_hub/presentation/widgets/grid_view_listing_widget.dart';
import 'package:flutter/material.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // Offer Slider
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: OfferSlider(),
        ),
        // End of Offer Slider

        // Top Listing
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Top Listing",
                style: Theme.of(context).textTheme.titleLarge,
              ),

              // Grid View
              GridViewListingWidget(
                items: DummyData.topListingList,
                rowCount: 2,
              )
              // End of Grid View
            ],
          ),
        ),
        // End of Top Listing

        // Recommended Listing
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Recommended",
                style: Theme.of(context).textTheme.titleLarge,
              ),

              // Grid View
              GridViewListingWidget(
                items: DummyData.topListingList,
              )
              // End of Grid View
            ],
          ),
        ),
        // End of Recommended Listing
      ],
    );
  }
}
