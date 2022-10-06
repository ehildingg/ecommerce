import 'package:ecommerce/presentation/screens/cart_page.dart';

import '../../buisness_logic/cubit/bloc/authentication_bloc.dart';
import '../../buisness_logic/cubit/cart_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GlobalAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const GlobalAppBar(this.title, {super.key});
  @override
  Size get preferredSize => const Size.fromHeight(60);

  void onPressedCartHandler(BuildContext context) {
    Navigator.of(context).pushNamed(CartPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  onPressedCartHandler(context);
                },
                icon: const Icon(Icons.shopping_cart),
              ),
              BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  return Text('\$${state.cart.valueGetter}');
                },
              ),
              const SizedBox(width: 20),
              IconButton(
                  onPressed: () =>
                      context.read<AuthenticationBloc>().add(LogoutStarted()),
                  icon: const Icon(Icons.logout_outlined)),
            ],
          ),
        ),
      ],
    );
  }
}
