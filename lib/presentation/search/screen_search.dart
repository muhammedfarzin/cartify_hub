import 'package:cartify_hub/presentation/constants/dummy_data.dart';
import 'package:cartify_hub/presentation/search/widgets/search_list_item.dart';
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
          return SearchListItem(item: DummyData.topListingList[index]);
        },
      )),
    );
  }
}
