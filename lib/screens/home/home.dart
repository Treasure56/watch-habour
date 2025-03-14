import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:watch_habour/screens/home/account_page.dart';
import 'package:watch_habour/screens/home/cart_page.dart';
import 'package:watch_habour/screens/home/home_page.dart';
import 'package:watch_habour/screens/home/wishlist_page.dart';
import 'package:watch_habour/utils/theme.dart';
import 'package:watch_habour/utils/utils.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _selectedIndex = 0; // Track selected tab

  // Screens for each tab
  static const List<Widget> _pages = [
    HomePage(),
    CartPage(),
    WishlistPage(),
    AccountPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _pages[_selectedIndex]), // Display selected page
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: size * 1.5),
        child: Theme(
          data: Theme.of(context).copyWith(canvasColor: AppColors.lightBody),
          child: BottomNavigationBar(
            elevation: 0,
            useLegacyColorScheme: false,
            enableFeedback: true,
            backgroundColor: Colors.red,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.house), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.cartShopping), label: 'Cart'),
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.heart), label: 'Wishlist'),
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.user), label: 'Account'),
            ],
            selectedItemColor: AppColors.primary, // Highlighted tab color
            unselectedItemColor: Colors.grey, // Unselected tab color
            showUnselectedLabels: true,
          ),
        ),
      ),
    );
  }
}
