import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/data/models/user_singleton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

import '../../data/dataproviders/CartAPI.dart';
import '../../data/models/cart_singleton.dart';
import '../../data/models/product.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState(cart: Cart())) {
    startUp();
  }

  CartAPI cartApi = CartAPI();
  UserSingleton user = UserSingleton();

  void cartToFirebase() async {
    // final db = FirebaseFirestore.instance;

    // final docRef = db.collection("users").doc("QKLayruqBDl7tjPQxZbX");
    // docRef.get().then(
    //   (DocumentSnapshot doc) {
    //     final data = doc.data() as Map<String, dynamic>;
    //     print(data);
    //   },
    //   onError: (e) => print("You messed up, $e"),
    // );
  }

  void addToCart(Product item) {
    Cart().valueSetter(item);
    cartApi.addProductToList(item, user.getUserId());
  }

  void startUp() {
    Cart().addListener(() {
      emit(CartState(cart: Cart()));
    });
  }
}
