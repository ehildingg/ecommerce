import 'package:ecommerce/data/cart_singleton.dart';
import 'package:ecommerce/data/dataproviders/CartAPI.dart';

import "../dataproviders/CartAPI.dart";
import '../dataproviders/RawCart.dart';

class CartRepo {
// Konvertera från rawCart till Cart

  late final CartAPI api = CartAPI();

  Future<void> getCartListById(id) async {
    final RawCart rawCart = await api.getCartByUserId(id);
    Cart cart = Cart();
    cart.cartSetter(rawCart.productList);
  }
}
