import 'package:bloc/bloc.dart';
import 'package:ecommerce/data/models/user_singleton.dart';
import 'package:ecommerce/data/repositories/cart_repository.dart';
import '../../data/models/cart_singleton.dart';
import '../../data/models/product.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState(cart: Cart())) {
    startUp();
  }

  CartRepository cartRepository = CartRepository();
  UserSingleton user = UserSingleton();

  void addToCart(Product item) {
    Cart().valueSetter(
        item); // Detta ska tas bort, valueSetter ska sättas utifrån vad som finns i Firestore
    cartRepository.addProductToList(item, user.getUserId());
  }

  void startUp() {
    Cart().addListener(() {
      emit(CartState(cart: Cart()));
    });
  }
}
