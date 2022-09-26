//Flödet = Singleton -> ValueListener -> Cubit -> UI?

import 'package:flutter/material.dart';

class Cart with ChangeNotifier {
  static final Cart _cart = Cart._internal();
  int cartSize = 0;
  ValueNotifier<double> cartValue = ValueNotifier<double>(2.0);

  double get valueGetter {
    return cartValue.value;
  }

  void valueSetter(double input) {
    cartValue.value = cartValue.value += input;
  }

  factory Cart() {
    return _cart;
  }

  Cart._internal();
}
