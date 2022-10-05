import 'package:ecommerce/presentation/screens/cart_page.dart';

import 'package:flutter/material.dart';

import 'buisness_logic/cubit/bloc/authentication_bloc.dart';
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
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.signOut();
    populateList();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CartCubit(),
        ),
        BlocProvider(
          create: (context) => AuthenticationBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FirebaseAuth.instance.currentUser != null
            ? const Home()
            : const LoginPage(),
        routes: {
          DetailsPage.routeName: (context) => const DetailsPage(),
          CartPage.routeName: (context) => CartPage(),
          LoginPage.routeName: (context) => const LoginPage(),
          Home.routeName: (context) => const Home(),
        },
      ),
    );
  }
}
