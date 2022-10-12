import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../data/models/Product.dart';
import '../widget/bottom_navbar.dart';
import '../widget/global_app_bar.dart';

class CategoriesPage extends StatefulWidget {
  CategoriesPage({super.key});

  static const routeName = '/categories';

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  bool _visible = true;
  List<Product> items = [
    Product(id: '1', name: 'Jackets', price: 100),
    Product(id: '2', name: 'Pants', price: 200),
    Product(id: '3', name: 'T-shirts', price: 50),
    Product(id: '4', name: 'Shirts', price: 125),
    Product(id: '5', name: 'Hoodies', price: 110)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppBar('Categories'),
      body: Column(
        children: [
          const SizedBox(height: 25),
          CarouselWidget(items: items, visible: _visible),
          const SizedBox(height: 25),
          const RandomTextWidget()
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          _visible = !_visible;
        });
      }),
    );
  }

  _buildBottomNavigationBar(BuildContext context) {
    int _selectedIndex = 1;
    return BottomNavbar(selectedIndex: _selectedIndex);
  }
}

class RandomTextWidget extends StatelessWidget {
  const RandomTextWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: const TextSpan(
            text: 'Don\'t have an account?',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
            children: <TextSpan>[
          TextSpan(
              text: 'Sign up',
              style: TextStyle(color: Colors.blueAccent, fontSize: 18))
        ]));
  }
}

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({
    Key? key,
    required this.items,
    required bool visible,
  })  : _visible = visible,
        super(key: key);

  final List<Product> items;
  final bool _visible;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CarouselSlider(
      options: CarouselOptions(
          height: 200.0, autoPlay: true, enlargeCenterPage: true),
      items: items.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              height: 50,
              width: 150,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 1000),
                opacity: _visible ? 1.0 : 0.0,
                child: Card(
                  color: const Color.fromARGB(217, 250, 227, 227),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: const BorderSide(
                          width: 1, color: Color.fromARGB(255, 82, 70, 69))),
                  elevation: 5,
                  child: Center(
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        Expanded(
                          flex: 1,
                          child: Text(
                            i.name,
                            style: const TextStyle(
                                fontSize: 16.0,
                                color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Image.asset(
                            'images/model1.jpg',
                            width: 150,
                            height: 150,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(height: 5),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      }).toList(),
    ));
  }
}
