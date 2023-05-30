import 'package:cartify_hub/presentation/account/screen_account.dart';
import 'package:cartify_hub/presentation/cart/screen_cart.dart';
import 'package:cartify_hub/presentation/category/screen_category.dart';
import 'package:cartify_hub/presentation/constants/font_weight_constants.dart';
import 'package:cartify_hub/presentation/home/screen_home.dart';
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
              fontWeight: FontWeightConstants.appBarTitle,
            ),
          ),
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

        body: SafeArea(
          // Offer Slider
          child: IndexedStack(
            index: _currentIndex,
            children: _screens,
          ),
          // End of Offer Slider
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
