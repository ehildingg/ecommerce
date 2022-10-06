import 'package:uuid/uuid.dart';
import 'models/Product.dart';

const uuid = Uuid();

List<Product> myItems = [];
void populateList() {
  for (int i = 0; i < 1000; i++) {
    myItems.add(Product(id: uuid.v1(), name: "Product $i", price: (i / 10)));
  }
}
