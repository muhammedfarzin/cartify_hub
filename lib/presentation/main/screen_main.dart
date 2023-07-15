import 'package:cartify_hub/presentation/account/screen_account.dart';
import 'package:cartify_hub/presentation/cart/screen_cart.dart';
import 'package:cartify_hub/presentation/category/screen_category.dart';
import 'package:cartify_hub/presentation/favorite/screen_favorite.dart';
import 'package:cartify_hub/presentation/home/screen_home.dart';
import 'package:cartify_hub/presentation/search/screen_search.dart';
import 'package:flutter/material.dart';

class ScreenMain extends StatefulWidget {
  const ScreenMain({super.key});

  @override
  State<ScreenMain> createState() => _ScreenMainState();
}

class _ScreenMainState extends State<ScreenMain> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    const ScreenHome(),
    const ScreenCategory(),
    const ScreenCart(),
    const ScreenAccount(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_currentIndex != 0) {
          setState(() {
            _currentIndex = 0;
          });
          return false;
        }
        return true;
      },
      child: Scaffold(
        // App Bar
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text(
            "Cartify Hub",
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: [
            // Search Button
            Hero(
              tag: "SearchButtonToBox",
              child: IconButton.outlined(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ScreenSearch(),
                      ));
                },
                icon: const Icon(Icons.search),
              ),
            ),

            // Favorite Button
            IconButton.outlined(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ScreenFavorite(),
                    ));
              },
              icon: const Icon(Icons.favorite),
            ),

            // More Button
            IconButton.outlined(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
            ),
          ],
        ),
        // End of App Bar

        body: SafeArea(
          // Screens
          child: IndexedStack(
            index: _currentIndex,
            children: _screens,
          ),
        ),

        // Bottom Navigation Bar
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: Theme.of(context).colorScheme.inversePrimary,
          currentIndex: _currentIndex,
          onTap: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: "Category",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: "Profile",
            ),
          ],
        ),
        // End of Bottom Navigation Bar
      ),
    );
  }
}
