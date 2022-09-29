import 'dart:math';
import 'package:uuid/uuid.dart';
import 'models/product.dart';

const uuid = Uuid();

List<Product> myItems = [];
void populateList() {
  for (int i = 0; i < 1000; i++) {
    myItems.add(Product(id: uuid.v1(), name: "Product $i", price: (i / 10)));
  }
  var priceDouble = double.parse((10.421421.toStringAsFixed(3)));
  // priceDouble = double.parse(priceDouble.toStringAsFixed(1));
  // print(priceDouble);
}
