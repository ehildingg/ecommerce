import 'package:ecommerce/presentation/widget/global_app_bar.dart';
import 'package:flutter/material.dart';

import '../../data/models/cart_singleton.dart';
import '../../data/models/product.dart';
import 'details_page.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});
  static const routeName = '/cart';

  var cart = Cart();

  void onTapProductHandler(Product product, BuildContext context) {
    Navigator.of(context)
        .pushNamed(DetailsPage.routeName, arguments: {'product': product});
  }

  @override
  Widget build(BuildContext context) {
    var cartList = cart.cartListGetter;

    return Scaffold(
        appBar: const GlobalAppBar('Shopping Cart'),
        body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: InkWell(
                onTap: () {
                  Product product = cartList[index];
                  onTapProductHandler(product, context);
                },
                child: (Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  height: 100,
                  child: Row(
                    children: [
                      // Text(dummyList[index]),
                      // SizedBox(width: 25),
                      // Text(dummyList[index])
                      Text(cartList[index].name)
                    ],
                  ),
                )),
              ),
            );
          },
          itemCount: cartList.length,
        ));
  }
}
