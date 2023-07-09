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
      body: const Center(
        child: Text("Screen favourite"),
      ),
    );
  }
}
