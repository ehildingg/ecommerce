//Flödet = Singleton -> ValueListener -> Cubit -> UI?

import 'package:ecommerce/data/models/Product.dart';
import 'package:flutter/material.dart';

class Cart with ChangeNotifier {
  static final Cart _cart = Cart._internal();

  ValueNotifier<List<Product>> cartItems = ValueNotifier<List<Product>>([]);

  // double cartValue = 2.0;

  double get valueGetter {
    double sum = 0;

    for (var item in cartItems.value) {
      sum += item.price;
    }
    sum = double.parse(sum.toStringAsFixed(2));
    print(sum);

    return sum;
  }

  List get cartListGetter {
    return cartItems.value;
  }

  void valueSetter(input) {
    cartItems.value.add(input);
    notifyListeners();
    // cartValue = cartValue += input;
  }

  factory Cart() {
    return _cart;
  }

  Cart._internal();
}
