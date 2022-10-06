// import 'package:bloc/bloc.dart';
// import 'package:ecommerce/data/models/user_singleton.dart';
// import 'package:ecommerce/data/repositories/cart_repository.dart';
// import '../../data/models/cart_singleton.dart';
// import '../../data/models/product.dart';

// part 'cart_state.dart';

// class CartCubit extends Cubit<CartState> {
//   CartCubit() : super(CartState(cart: Cart())) {
//     startUp();
//   }

//   CartRepository cartRepository = CartRepository();
//   UserSingleton user = UserSingleton();

//   Future<void> updateCart() async {
//     List updatedCartList = [];
//     await cartRepository
//         .getCartListById(user.userId)
//         .then((value) => updatedCartList = value);
//     Cart().cartSetter(updatedCartList);
//     emit(CartState(cart: Cart()));
//   }

//   Future<void> addToCart(Product item) async {
//     await cartRepository.addProductToList(item, user.getUserId());
//     List updatedCartList = [];
//     await cartRepository
//         .getCartListById(user.userId)
//         .then((value) => updatedCartList = value);

//     Cart().cartSetter(updatedCartList);
//     emit(CartState(cart: Cart()));
//   }

//   void startUp() {
//     Cart().addListener(() {
//       emit(CartState(cart: Cart()));
//     });
//   }
// }
