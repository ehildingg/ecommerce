import 'package:ecommerce/data/models/Product.dart';
import 'package:ecommerce/data/models/user_singleton.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../dataproviders/firestore_cart.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class CartRepository {
  var db = FirebaseFirestore.instance;
// Konvertera från rawCart till Cart

  Future<void> createCartById(userUuid) async {
    db.collection('cart').doc(userUuid).set({'productList': []});
  }

  Future<void> addProductToList(product, userid) async {
    Map<String, dynamic> productToFirestore = {
      'id': product.id,
      'name': product.name,
      'price': product.price
    };
    db.collection('cart').doc(userid).update({
      'productList': FieldValue.arrayUnion([productToFirestore])
    });
  }

  FirestoreCart updatedCartFromFirestore() {
    final docRef = db.collection('cart').doc(UserSingleton().userId);
    FirestoreCart rawCart = FirestoreCart(productList: []);
    var data;
    try {
      docRef.snapshots().listen((event) {
        print("current data: ${event.data()}");
        final data = event.data() as Map<String, dynamic>;
        rawCart = FirestoreCart(productList: data['productList']);
        onError:
        (error) => print("Listen failed: $error");
      });
    } catch (e) {
      throw Exception('failed $e');
    }
    return rawCart;
  }

  Future<FirestoreCart> getCartByUserIdfromFirestore(id) async {
    FirestoreCart rawCart = FirestoreCart(productList: []);
    try {
      final docRef = db.collection("cart").doc(id);
      await docRef.get().then((DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        rawCart = FirestoreCart(productList: data['productList']);

        return rawCart;
      });
    } catch (e) {
      throw Exception('Fail');
    }

    return rawCart;
  }

  Future<List> getCartListById(id) async {
    final FirestoreCart rawCart = await getCartByUserIdfromFirestore(id);

    List<Product> list = [];
    for (var element in rawCart.productList) {
      var price = element['price'].toDouble();
      list.add(Product(id: element['id'], name: element['name'], price: price));
    }
    return list;
  }

  Future<List> updateCartList() async {
    final FirestoreCart rawCart = await updatedCartFromFirestore();

    List<Product> list = [];
    for (var element in rawCart.productList) {
      var price = element['price'].toDouble();
      list.add(Product(id: element['id'], name: element['name'], price: price));
    }
    return list;
  }
}
