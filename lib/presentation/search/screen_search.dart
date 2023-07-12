import 'package:cartify_hub/presentation/constants/dummy_data.dart';
import 'package:flutter/material.dart';

class ScreenSearch extends StatelessWidget {
  ScreenSearch({super.key});

  final TextEditingController _searchEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Size screenSize = MediaQuery.of(context).size;

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
          child: ListView.builder(
        itemCount: DummyData.topListingList.length,
        itemBuilder: (context, index) {
          final item = DummyData.topListingList[index];
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: colorScheme.inversePrimary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 0.5,
                color: colorScheme.primary,
              ),
            ),
            child: Row(
              children: [
                // Product Image
                Container(
                  width: screenSize.width * 0.25,
                  height: screenSize.width * 0.25,
                  padding: const EdgeInsets.all(3),
                  constraints: const BoxConstraints(
                    minWidth: 120,
                    minHeight: 120,
                    maxWidth: 200,
                    maxHeight: 200,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 1,
                      color: colorScheme.inversePrimary.withOpacity(0.5),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(item.imageUrl),
                  ),
                ),
                // End of Product Image
              ],
            ),
          );
        },
      )),
    );
  }
}
