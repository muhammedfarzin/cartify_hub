import 'package:flutter/material.dart';

class ScreenCart extends StatelessWidget {
  const ScreenCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Top Section (ListView)
        Expanded(child: ListView()),
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
    );
  }
}
