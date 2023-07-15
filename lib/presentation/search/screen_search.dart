import 'package:cartify_hub/presentation/constants/asset_images.dart';
import 'package:flutter/material.dart';

class ScreenSearch extends StatelessWidget {
  ScreenSearch({super.key});

  final TextEditingController _searchEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      // AppBar
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: colorScheme.inversePrimary,
          title: Hero(
            tag: "SearchButtonToBox",
            child: Material(
              color: Colors.transparent,
              child: Container(
                padding: const EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                  color: colorScheme.background,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextFormField(
                  controller: _searchEditingController,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: "Search for Products",
                    filled: true,
                    fillColor: colorScheme.background,
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                      onPressed: () {
                        _searchEditingController.clear();
                      },
                      icon: const Icon(
                        Icons.clear,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      // End of AppBar

      body: SafeArea(
          child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 300,
            maxHeight: MediaQuery.sizeOf(context).height,
          ),
          child: Image.asset(AssetImages.searchProduct),
        ),
      )),
    );
  }
}
