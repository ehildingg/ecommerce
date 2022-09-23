class Cart {
  static final Cart _cart = Cart._internal();

  double cartValue = 0.0;

  void example() {
    print(cartValue);
  }

  double get valueGetter {
    return cartValue;
  }

  void valueSetter(double input) {
    cartValue = cartValue + input;
  }

  factory Cart() {
    return _cart;
  }

  Cart._internal();
}
