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
    print(rawCart.productList);
    return rawCart;
  }

  Future<void> testar() async {
    final ref = db.collection("cart").doc("UKjXwZVdIxMKOt64YdCHOYmIxDq1");
  }
}



// {productList: [{blabla: fsa, productName: Skjorta, sfa: fsa}, {productName: tröja, price: 123, fasf: sfafas}]}

// data[1].price == 123

// data['productList'][0].blabla == fsa
