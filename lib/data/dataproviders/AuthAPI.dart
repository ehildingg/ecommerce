import 'package:ecommerce/data/dataproviders/CartAPI.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_singleton.dart';

class AuthAPI {
  CartAPI cartApi = CartAPI();
  final userSingleton = UserSingleton();

  Future<void> loginUser(emailInput, passwordInput) async {
    var user = FirebaseAuth.instance;
    await user.signInWithEmailAndPassword(
        email: emailInput, password: passwordInput);

    if (user.currentUser != null) {
      userSingleton.setId(user.currentUser!.uid);
      userSingleton.setUserEmail(user.currentUser!.email);
    }
  }

  Future<void> registerUser(emailInput, passwordInput) async {
    var user = FirebaseAuth.instance;
    await user.createUserWithEmailAndPassword(
        email: emailInput, password: passwordInput);

    if (user.currentUser != null) {
      userSingleton.setId(user.currentUser!.uid);
      userSingleton.setUserEmail(user.currentUser!.email);
    }
  }
}
