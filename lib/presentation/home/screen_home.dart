import 'package:carousel_slider/carousel_slider.dart';
import 'package:cartify_hub/presentation/constants/font_weight_constants.dart';
import 'package:flutter/material.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

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

      body: SafeArea(
        // Offer Slider
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 5),
              enlargeCenterPage: true,
              aspectRatio: 20 / 9,
            ),
            items: [
              "https://static.toiimg.com/thumb/msid-99851728,width-1280,height-720,resizemode-4/.jpg",
              "https://img.freepik.com/free-vector/gradient-sale-background_23-2148934477.jpg?w=2000",
              "https://img.freepik.com/free-vector/gradient-mega-sale-background_23-2149040904.jpg",
            ].map((imageUrl) {
              return Builder(
                builder: (context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5),

                    // Image View
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image(
                        image: NetworkImage(imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                    // End of Image View
                  );
                },
              );
            }).toList(),
          ),
        ),
        // End of Offer Slider
      ),
    );
  }
}
