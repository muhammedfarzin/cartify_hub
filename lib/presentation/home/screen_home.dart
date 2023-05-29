import 'package:flutter/material.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App Bar
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Cartify Hub"),
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
    );
  }
}
