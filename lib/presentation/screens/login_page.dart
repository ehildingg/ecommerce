import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/data/repositories/CartRepository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../data/dataproviders/AuthAPI.dart';
import '../../data/dataproviders/CartAPI.dart';
import '../../data/models/cart_singleton.dart';
import '../../data/repositories/CartRepository.dart';
import 'home_page.dart';

//USER createUser() -> Får User UUID -> createCart(userUuid)
//CART -> useruIid -> ARRAY -> ProduktItem
// getCart(userId), returnerar lista med ProductItems

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const routeName = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String userEmailLogin;
  late String userPasswordLogin;

  late String userEmailRegister;
  late String userPasswordRegister;

  final db = FirebaseFirestore.instance;
  final fUser = FirebaseAuth.instance.currentUser;
  final CartRepo cartRepo = CartRepo();
  final cart = Cart();
  final CartAPI cartApi = CartAPI();
  AuthAPI auth = AuthAPI();

  Future<void> registerUser(emailInput, passwordInput) async {
    await auth.registerUser(emailInput, passwordInput);

    var user = FirebaseAuth.instance;
    if (user.currentUser != null) {
      var userId = user.currentUser?.uid;
      await cartApi.createCartById(userId);
      NavigateToHome();
    } else {
      print('något gick fel med registrera');
    }
  }

  Future<void> loginUser(emailInput, passwordInput) async {
    AuthAPI auth = AuthAPI();

    await auth.loginUser(emailInput, passwordInput);

    var user = FirebaseAuth.instance;

    if (user.currentUser != null) {
      await cartRepo.getCartListById(user.currentUser?.uid);
      print(cart.cartListGetter[0].price);
      NavigateToHome();
    } else {
      print('Något gick fel med inloggningingingingg');
    }
  }

  NavigateToHome() {
    Navigator.of(context).pushNamed(Home.routeName);
  }

  final GlobalKey<FormState> _formKeyLogin = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyRegister = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Container(
            width: 350,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                Form(
                  key: _formKeyLogin,
                  child: Column(
                    children: <Widget>[
                      Text('Login'),
                      TextFormField(
                        decoration: const InputDecoration(
                            icon: Icon(Icons.person),
                            hintText: 'Email Adress',
                            labelText: 'Email Adress'),
                        validator: (String? emailInput) {
                          if (emailInput == null || emailInput.isEmpty) {
                            return 'Please enter username';
                          } else {
                            userEmailLogin = emailInput;
                            return null;
                          }
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                            icon: Icon(Icons.password),
                            hintText: 'Password',
                            labelText: 'Password'),
                        validator: (String? passwordInput) {
                          if (passwordInput == null || passwordInput.isEmpty) {
                            return 'Please enter password';
                          } else {
                            userPasswordLogin = passwordInput;
                            return null;
                          }
                        },
                      ),
                      Padding(padding: EdgeInsets.all(8)),
                      Center(
                        child: Column(
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  if (_formKeyLogin.currentState!.validate()) {
                                    loginUser(
                                        userEmailLogin, userPasswordLogin);
                                  }
                                },
                                child: Text('Login')),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 50),
                Form(
                  key: _formKeyRegister,
                  child: Column(
                    children: <Widget>[
                      Text('Register'),
                      TextFormField(
                        decoration: const InputDecoration(
                            icon: Icon(Icons.person),
                            hintText: 'Email Adress',
                            labelText: 'Email Adress'),
                        validator: (String? emailInput) {
                          if (emailInput == null || emailInput.isEmpty) {
                            return 'Please enter username';
                          } else {
                            userEmailRegister = emailInput;
                            return null;
                          }
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                            icon: Icon(Icons.password),
                            hintText: 'Password',
                            labelText: 'Password'),
                        validator: (String? passwordInput) {
                          if (passwordInput == null || passwordInput.isEmpty) {
                            return 'Please enter password';
                          } else {
                            userPasswordRegister = passwordInput;
                            return null;
                          }
                        },
                      ),
                      Padding(padding: EdgeInsets.all(8)),
                      Center(
                        child: Column(
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  if (_formKeyRegister.currentState!
                                      .validate()) {
                                    registerUser(userEmailRegister,
                                        userPasswordRegister);
                                  }
                                },
                                child: Text('Register')),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
