part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {
  const AuthenticationEvent();
}

class LoginStarted extends AuthenticationEvent {
  final String userEmail;
  final String userPassword;
  LoginStarted(this.userEmail, this.userPassword);
}

class RegistrationStarted extends AuthenticationEvent {
  final String userEmail;
  final String userPassword;
  RegistrationStarted(this.userEmail, this.userPassword);
}
