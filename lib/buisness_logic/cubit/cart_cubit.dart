import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState(cartSum: 0.0));

  void addToCart(price) => emit(CartState(cartSum: state.cartSum += price));
}
