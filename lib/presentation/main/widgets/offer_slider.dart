import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class OfferSlider extends StatelessWidget {
  const OfferSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
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
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blueGrey.shade100,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(11),
              ),

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
    );
  }
}
