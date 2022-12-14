import 'package:ecommerce/buisness_logic/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/Product.dart';
import '../widget/global_app_bar.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});
  static const routeName = '/details';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, Product>;

    final productName = routeArgs['product']!.name;

    return Scaffold(
      appBar: GlobalAppBar(productName),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 12, left: 10, right: 10),
          child: Center(
            child: Column(
              children: [
                const Text(
                  'TITLE',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                const SizedBox(height: 15),
                Image.asset(
                  'images/model1.jpg',
                  width: double.infinity,
                ),
                const SizedBox(height: 15),
                const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam ultrices mauris at nulla gravida fringilla. Aenean commodo quam et mauris bibendum, id feugiat felis accumsan. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Cras vitae ligula nibh. Aenean magna tellus, bibendum non tristique in, lacinia id urna. Vestibulum eu dui quis eros pharetra lacinia sed at lorem. Etiam et massa nec nisi maximus vestibulum. Duis venenatis et ligula non sagittis. Duis feugiat leo felis, vitae gravida ante lacinia nec. Phasellus at lacus at erat auctor interdum sit amet quis velit. Vestibulum maximus, lacus at dictum. ')
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  _buildBottomNavigationBar() {
    return const BottomNavbar();
  }
}

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, Product>;

    final Product? product = routeArgs['product'];
    var productPrice = product!.price;

    return SizedBox(
      height: 50.0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0)))),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Icon(
                      Icons.list,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 4.0,
                    ),
                    Text(
                      "SAVE",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0)))),
              onPressed: () {
                // BlocProvider.of<CartCubit>(context).addToCart(product);
                context.read<CartBloc>().add(ProductAdded(product));
              },
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Icon(
                      Icons.card_travel,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 4.0,
                    ),
                    Text(
                      "ADD TO BAG \$$productPrice",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
