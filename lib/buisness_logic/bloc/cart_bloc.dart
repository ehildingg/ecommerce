import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce/data/repositories/cart_repository.dart';
import 'package:meta/meta.dart';

import '../../data/models/Product.dart';
import '../../data/models/cart_singleton.dart';
import '../../data/models/user_singleton.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState(cart: Cart())) {
    on<ProductAdded>(_onProductAdded);
    on<CartUpdated>(_onCartUpdated);
    on<ListenToCart>(_listenToCart);
  }

  final CartRepository _cartRepository = CartRepository();
  UserSingleton user = UserSingleton();

  FutureOr<void> _onProductAdded(
      ProductAdded event, Emitter<CartState> emit) async {
    await _cartRepository.addProductToList(event.product, user.getUserId());
    List updatedCartList = [];
    await _cartRepository
        .getCartListById(user.userId)
        .then((value) => updatedCartList = value);

    Cart().cartSetter(updatedCartList);
    emit(CartState(cart: Cart()));
  }

  FutureOr<void> _onCartUpdated(
      CartUpdated event, Emitter<CartState> emit) async {
    List updatedCartList = [];
    await _cartRepository
        .getCartListById(user.userId)
        .then((value) => updatedCartList = value);
    Cart().cartSetter(updatedCartList);
    emit(CartState(cart: Cart()));
  }

  FutureOr<void> _listenToCart(
      ListenToCart event, Emitter<CartState> emit) async {
    //  var stream = _cartRepository.updatedCartFromFirestore();
    // Cart().cartSetter(stream);
    // print('i listenToCart i cart_bloc');
    // emit(CartState(cart: Cart()));
    await emit.onEach(stream, onData: (stream) => Cart().cartSetter(stream));
    emit(CartState(cart: Cart()));
  }
}

// on<_TickerTicked>((event, emit) => emit(TickerTickSuccess(event.tick)));

// await emit.onEach<int>(
//           ticker.tick(),
//           onData: (tick) => add(_TickerTicked(tick)),
//         );
//         emit(const TickerComplete());
//       },
