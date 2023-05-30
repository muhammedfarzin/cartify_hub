import 'package:cartify_hub/presentation/main/widgets/offer_slider.dart';
import 'package:flutter/material.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: OfferSlider(),
        ),
      ],
    );
  }
}
