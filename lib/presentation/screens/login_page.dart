import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
  late String userEmail;
  late String userPassword;

  final db = FirebaseFirestore.instance;
  final fUser = FirebaseAuth.instance.currentUser;

  Future<void> createUser(emailInput, passwordInput) async {
    var user = FirebaseAuth.instance;
    await user.createUserWithEmailAndPassword(
        email: userEmail, password: passwordInput);
    var userId = user.currentUser?.uid;
    await createCart(userId);
    NavigateToHome();
  }

  Future<void> createCart(userUuid) async {
    db.collection('cart').doc(userUuid).set({'productList': []});
  }

  NavigateToHome() {
    Navigator.of(context).pushNamed(Home.routeName);
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'Email Adress',
                labelText: 'Email Adress'),
            validator: (String? emailInput) {
              if (emailInput == null || emailInput.isEmpty) {
                return 'Please enter username';
              } else {
                userEmail = emailInput;
                return null;
              }
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
                icon: Icon(Icons.password),
                hintText: 'Password',
                labelText: 'Password'),
            validator: (String? passwordInput) {
              if (passwordInput == null || passwordInput.isEmpty) {
                return 'Please enter password';
              } else {
                userPassword = passwordInput;
                return null;
              }
            },
          ),
          Padding(padding: EdgeInsets.all(8)),
          ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  createUser(userEmail, userPassword);
                }
              },
              child: Text('Logga in'))
        ],
      ),
    )));
  }
}
