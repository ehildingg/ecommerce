import 'package:ecommerce/data/repositories/cart_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_singleton.dart';

class UserRepository {
  final userSingleton = UserSingleton();
  final CartRepository cartRepository = CartRepository();

  Future<void> loginUser(emailInput, passwordInput) async {
    var user = FirebaseAuth.instance;
    await user.signInWithEmailAndPassword(
        email: emailInput, password: passwordInput);

    if (user.currentUser != null) {
      userSingleton.setId(user.currentUser!.uid);
      userSingleton.setUserEmail(user.currentUser!.email);
      await cartRepository.getCartListById(user.currentUser?.uid);
    }
  }

  Future<void> registerUser(emailInput, passwordInput) async {
    var user = FirebaseAuth.instance;
    await user.createUserWithEmailAndPassword(
        email: emailInput, password: passwordInput);

    if (user.currentUser != null) {
      userSingleton.setId(user.currentUser!.uid);
      userSingleton.setUserEmail(user.currentUser!.email);
      await cartRepository.createCartById(user.currentUser!.uid);
    }
  }

  Future<void> logoutUser() async {
    await FirebaseAuth.instance.signOut();
  }
}
