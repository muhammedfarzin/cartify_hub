import 'package:cartify_hub/presentation/constants/asset_images.dart';
import 'package:cartify_hub/presentation/widgets/animated_icon_button.dart';
import 'package:flutter/material.dart';

class ScreenSearch extends StatefulWidget {
  const ScreenSearch({super.key});

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {
  final TextEditingController _searchEditingController =
      TextEditingController();

  bool showProducts = false;

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
              child: AnimatedSize(
                duration: const Duration(milliseconds: 1500),
                curve: Curves.elasticOut,
                child: Container(
                  padding: const EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    color: colorScheme.background,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextFormField(
                    controller: _searchEditingController,
                    autofocus: true,
                    onFieldSubmitted: (value) {
                      // Write Here what happens on Search submit
                      if (_searchEditingController.text.isNotEmpty) {
                        setState(() {
                          showProducts = true;
                        });
                      }
                    },
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
          actions: [
            if (showProducts)
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: AnimatedIconButton(
                  curve: Curves.elasticOut,
                  child: IconButton.outlined(
                    onPressed: () {},
                    icon: const Icon(Icons.shopping_cart),
                  ),
                ),
              ),
          ],
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
