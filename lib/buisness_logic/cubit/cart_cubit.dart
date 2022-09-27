import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

import '../../data/cart_singleton.dart';
import '../../data/models/Product.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState(cart: Cart())) {
    startUp();
  }

  void cartToFirebase() async {
    final db = FirebaseFirestore.instance;
    final fUser = FirebaseAuth.instance.currentUser;

    final user = <String, dynamic>{
      'emailAdress': "wda",
      'password ': 'testblablabl'
    };

    db.collection("users").add(user).then((DocumentReference doc) =>
        print('DocumentSnapshot added with ID: ${doc.id}'));

    //USER createUser() -> Får User UUID -> createCart(userUuid)
    //CART -> useruIid -> ARRAY -> ProduktItem
    // getCart(userId), returnerar lista med ProductItems

    // await db.collection("users").get().then((event) {
    //   for (var doc in event.docs) {
    //     print("${doc.id} => ${doc.data()}");
    //   }
    // });
    final docRef = db.collection("users").doc("QKLayruqBDl7tjPQxZbX");
    docRef.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        print(data);
      },
      onError: (e) => print("You messed up, $e"),
    );
  }

  void addToCart(Product item) {
    Cart().valueSetter(item);
    cartToFirebase();
  }

  void startUp() {
    Cart().addListener(() {
      emit(CartState(cart: Cart()));
    });
  }
}
