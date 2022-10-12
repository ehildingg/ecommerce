import 'package:flutter/material.dart';

import '../screens/categories_page.dart';
import '../screens/home_page.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({
    Key? key,
    required int selectedIndex,
  })  : _selectedIndex = selectedIndex,
        super(key: key);

  final int _selectedIndex;

  @override
  Widget build(BuildContext context) {
    void _onItemTapped(int index) {
      if (index == 0) {
        Navigator.of(context).pop();
        Navigator.of(context).pushNamed(Home.routeName);
      }
      if (index == 1) {
        Navigator.of(context).pop();
        Navigator.of(context).pushNamed(CategoriesPage.routeName);
      }
    }

    return BottomNavigationBar(
      // backgroundColor: Colors.white10,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
          backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.category),
          label: 'Categories',
          backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Colors.blue),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }
}
