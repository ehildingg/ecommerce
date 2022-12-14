import 'package:ecommerce/data/models/Product.dart';
import 'package:ecommerce/data/models/user_singleton.dart';

import '../dataproviders/firestore_cart.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class CartRepository {
  var db = FirebaseFirestore.instance;
// Konvertera från rawCart till Cart

  Future<List> getCartListById(id) async {
    final FirestoreCart rawCart = await getCartByUserIdfromFirestore(id);

    List<Product> list = [];
    for (var element in rawCart.productList) {
      var price = element['price'].toDouble();
      list.add(Product(id: element['id'], name: element['name'], price: price));
    }
    return list;
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

  final Stream<QuerySnapshot> databaseStream = FirebaseFirestore.instance
      .collection('cart')
      .doc('EFMaISPAkdbVzieOPLPrgt9nXJ82')
      .collection('productList')
      .snapshots();
}
