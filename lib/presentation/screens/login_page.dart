import 'package:ecommerce/buisness_logic//bloc/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../buisness_logic/bloc/cart_bloc.dart';
import 'home_page.dart';

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

  navigateToHome() {
    Navigator.of(context).pushNamed(Home.routeName);
  }

  final GlobalKey<FormState> _formKeyLogin = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyRegister = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is Authenticated) {
            context.read<CartBloc>().add(CartUpdated());
            navigateToHome();
          }
        },
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/background.jpg'),
              fit: BoxFit.fill,
            ),
          ),
          child: Center(
            child: SizedBox(
              width: 350,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  Form(
                    key: _formKeyLogin,
                    child: Column(
                      children: <Widget>[
                        const Text('Login'),
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
                            if (passwordInput == null ||
                                passwordInput.isEmpty) {
                              return 'Please enter password';
                            } else {
                              userPasswordLogin = passwordInput;
                              return null;
                            }
                          },
                        ),
                        const Padding(padding: EdgeInsets.all(8)),
                        Center(
                          child: Column(
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    if (_formKeyLogin.currentState!
                                        .validate()) {
                                      context.read<AuthenticationBloc>().add(
                                          LoginStarted(userEmailLogin,
                                              userPasswordLogin));
                                    }
                                  },
                                  child: const Text('Login')),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  Form(
                    key: _formKeyRegister,
                    child: Column(
                      children: <Widget>[
                        const Text('Register'),
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
                            if (passwordInput == null ||
                                passwordInput.isEmpty) {
                              return 'Please enter password';
                            } else {
                              userPasswordRegister = passwordInput;
                              return null;
                            }
                          },
                        ),
                        const Padding(padding: EdgeInsets.all(8)),
                        Center(
                          child: Column(
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    if (_formKeyRegister.currentState!
                                        .validate()) {
                                      context.read<AuthenticationBloc>().add(
                                          RegistrationStarted(userEmailRegister,
                                              userPasswordRegister));
                                    }
                                  },
                                  child: const Text('Register')),
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
      ),
    );
  }
}
