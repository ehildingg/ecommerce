import 'package:flutter/material.dart';

import 'presentation/screens/details_page.dart';
import 'presentation/screens/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'buisness_logic/cubit/cart_cubit.dart';

// Create Cart Class as a Singleton

// Listen to cart class variable using value notifier
// Find right position inside bloc/cubit class to introduce value notifier functions

// Nested Scrollview?
// https://blog.geekyants.com/flutter-e-commerce-backend-app-2d23121fd0c8-2d23121fd0c8

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const Home(),
        routes: {
          DetailsPage.routeName: (context) => DetailsPage(),
        },
      ),
    );
  }
}
