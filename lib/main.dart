import 'package:ecommerce/data/dataproviders/CartAPI.dart';
import 'package:ecommerce/presentation/screens/cart_page.dart';

import 'package:flutter/material.dart';

import 'data/dummy_data.dart';
import 'presentation/screens/details_page.dart';
import 'presentation/screens/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'buisness_logic/cubit/cart_cubit.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'presentation/screens/login_page.dart';

// ...

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  var cartApi = CartAPI();

  @override
  Widget build(BuildContext context) {
    populateList();
    return BlocProvider(
      create: (context) => CartCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FirebaseAuth.instance.currentUser != null ? Home() : LoginPage(),
        routes: {
          DetailsPage.routeName: (context) => DetailsPage(),
          CartPage.routeName: (context) => CartPage(),
          LoginPage.routeName: (context) => const LoginPage(),
          Home.routeName: (context) => Home(),
        },
      ),
    );
  }
}
