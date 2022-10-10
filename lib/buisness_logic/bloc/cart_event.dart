part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class ProductAdded extends CartEvent {
  final Product product;
  ProductAdded(this.product);
}

class CartUpdated extends CartEvent {}

class ListenToCart extends CartEvent {}
