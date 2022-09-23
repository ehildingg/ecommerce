import 'package:flutter/material.dart';

import './screens/details_page.dart';
import './screens/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Home(),
      routes: {
        DetailsPage.routeName: (context) => const DetailsPage(),
      },
    );
  }
}
