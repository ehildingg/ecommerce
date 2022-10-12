import 'package:ecommerce/presentation/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../buisness_logic//bloc/authentication_bloc.dart';
import '../widget/bottom_navbar.dart';
import '../widget/details_item.dart';
import '../../data/dummy_data.dart';
import '../widget/global_app_bar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppBar('Home'),
      body: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is UnAuthenticated) {
            navigateToLogin(context);
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 2 / 3,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            itemCount: myItems.length,
            itemBuilder: (context, index) {
              return DetailsItem(index);
            },
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  _buildBottomNavigationBar(BuildContext context) {
    int _selectedIndex = 0;
    return BottomNavbar(selectedIndex: _selectedIndex);
  }

  void navigateToLogin(BuildContext context) {
    Navigator.of(context).pushNamed(LoginPage.routeName);
  }
}
