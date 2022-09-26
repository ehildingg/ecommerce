import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

import '../../data/cart_singleton.dart';
import '../../data/models/Product.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState(cart: Cart())) {
    startUp();
  }

  void addToCart(Product item) {
    Cart().valueSetter(item);
  }

  void startUp() {
    Cart().addListener(() {
      emit(CartState(cart: Cart()));
    });
  }
}
