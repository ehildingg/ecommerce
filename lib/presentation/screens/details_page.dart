import 'package:ecommerce/buisness_logic/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/cart_singleton.dart';
import '../widget/global_app_bar.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({super.key});
  static const routeName = '/details';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    // final detailsId = routeArgs['id'];
    final detailsName = routeArgs['name'];

    return Scaffold(
      appBar: GlobalAppBar(detailsName),
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
    return BottomNavbar();
  }
}

class BottomNavbar extends StatelessWidget {
  BottomNavbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final double price = routeArgs['price'];
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
                BlocProvider.of<CartCubit>(context).addToCart(price);
              },
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Icon(
                      Icons.card_travel,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 4.0,
                    ),
                    Text(
                      "ADD TO BAG",
                      style: TextStyle(color: Colors.white),
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
