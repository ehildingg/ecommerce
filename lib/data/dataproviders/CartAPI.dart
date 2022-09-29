import 'package:cloud_firestore/cloud_firestore.dart';

import 'RawCart.dart';

class CartAPI {
  var db = FirebaseFirestore.instance;

  Future<RawCart> getCartByUserId(id) async {
    RawCart rawCart = RawCart(productList: []);
// "UKjXwZVdIxMKOt64YdCHOYmIxDq1"
    try {
      final docRef = db.collection("cart").doc(id);
      await docRef.get().then((DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        rawCart = RawCart(productList: data['productList']);

        return rawCart;
      });
    } catch (e) {
      throw new Exception('Fail');
    }

    return rawCart;
  }

  Future<void> createCartById(userUuid) async {
    db.collection('cart').doc(userUuid).set({'productList': []});
  }

  Future<void> addProductToList(product, userid) async {
    print('hamnat här iaf');
    print(product.name);
    print(product.runtimeType);
    Map<String, dynamic> test = {
      'id': product.id,
      'name': product.name,
      'price': product.price
    };
    print(test.runtimeType);
    // Funkar, men blir fel struktur
    // db.collection('cart').doc(userid).update({
    //   'productList': FieldValue.arrayUnion([
    //     {product.id, product.name, product.price}
    //   ]),
    // });

    // db.collection("cart").doc(userid).set(test);

    db.collection('cart').doc(userid).update({
      'productList': FieldValue.arrayUnion([test])
    });

    // db.collection('cart').doc(userid).collection('productList').add(product);
  }
}





// {productList: [{blabla: fsa, productName: Skjorta, sfa: fsa}, {productName: tröja, price: 123, fasf: sfafas}]}

// data[1].price == 123

// data['productList'][0].blabla == fsa
