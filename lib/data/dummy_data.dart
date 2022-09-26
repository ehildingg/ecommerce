import 'dart:math';

final List<Map> myItems = List.generate(
    100000,
    (index) => {
          "id": index,
          "name": "Product $index",
          "price": (index / 10)
        }).toList();

double roundDouble(double value, int places) {
  num mod = pow(10.0, places);
  return ((value * mod).round().toDouble() / mod);
}
