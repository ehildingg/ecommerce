import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

import '../../data/cart_singleton.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  var cart = Cart();
  CartCubit() : super(CartState(cart: Cart()));

  void addToCart(price) {
    cart.valueSetter(price);
    emit(CartState(cart: cart));
  }

  // ValueListenable<cartSingleton>() =>
  //     emit(CartState(cartSum: double.parse(cartSingleton.toString())));

  // void addToCart2() {
  //   cartSingleton.valueSetter(10.0);
  //   print('add to cart');
  //   print(cartSingleton.cartValue.value);
  //   print(state.cartSum);
  // }

  // void listenToCart() {
  //   cartSingleton.cartValue.addListener(() {
  //     print('värde ändrades');
  //     print(cartSingleton.cartValue.value);
  //   });
  // }
}
