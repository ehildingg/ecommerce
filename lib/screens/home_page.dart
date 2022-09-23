import 'package:flutter/material.dart';

import '../widget/details_item.dart';
import '../dummy_data.dart';
import '../widget/global_app_bar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const GlobalAppBar('Home'),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 1,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            itemCount: myItems.length,
            itemBuilder: (context, index) {
              return DetailsItem(index);
            },
          ),
        ),
        bottomNavigationBar: _buildBottomNavigationBar());
  }

  _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.blue),
        BottomNavigationBarItem(
            icon: Icon(Icons.category), label: 'Categories'),
        BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Colors.blue),
        BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
            backgroundColor: Colors.blue),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: 'Bag')
      ],
    );
  }
}
