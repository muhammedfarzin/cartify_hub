import 'package:cartify_hub/presentation/cart/screen_cart.dart';
import 'package:cartify_hub/presentation/constants/asset_images.dart';
import 'package:cartify_hub/presentation/constants/dummy_data.dart';
import 'package:cartify_hub/presentation/search/widgets/search_input_box.dart';
import 'package:cartify_hub/presentation/search/widgets/search_list_item.dart';
import 'package:cartify_hub/presentation/widgets/animated/scale_animated_widget.dart';
import 'package:cartify_hub/presentation/widgets/animated/slide_to_left_animated_switcher.dart';
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
            tag: "title search box",
            child: Material(
              color: Colors.transparent,
              child: AnimatedSize(
                duration: const Duration(milliseconds: 1500),
                curve: Curves.elasticOut,
                child: SearchInputBox(
                  controller: _searchEditingController,
                  onSubmitted: (value) {
                    // Write Here what happens on Search submit
                    if (_searchEditingController.text.isNotEmpty) {
                      setState(() {
                        showProducts = true;
                      });
                    }
                  },
                ),
              ),
            ),
          ),
          actions: [
            if (showProducts)
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: ScaleAnimatedWidget(
                  curve: Curves.elasticOut,
                  child: IconButton.outlined(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const ScreenCart(showAppBar: true),
                          ));
                    },
                    icon: const Icon(Icons.shopping_cart),
                  ),
                ),
              ),
          ],
        ),
      ),
      // End of AppBar

      body: SafeArea(
        child: SlideToLeftAnimatedSwitcher(
          showSecondWidget: showProducts,
          // This widget will show when screen build
          firstWidget: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 300,
                maxHeight: MediaQuery.sizeOf(context).height,
              ),
              child: Image.asset(AssetImages.searchProduct),
            ),
          ),

          // This widget will show when search data submit
          secondWidget: ListView.builder(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            itemCount: DummyData.topListingList.length,
            itemBuilder: (context, index) {
              final Product item = DummyData.topListingList[index];
              return SearchListItem(item: item);
            },
          ),
        ),
      ),
    );
  }
}
