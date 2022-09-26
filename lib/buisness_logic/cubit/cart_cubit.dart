import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

import '../../data/cart_singleton.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState(cart: Cart()));

  void addToCart(price) {
    Cart().valueSetter(price);
    emit(CartState(cart: Cart()));
  }
}
