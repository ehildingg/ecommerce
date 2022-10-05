part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {
  const AuthenticationEvent();
}

class LoginStarted extends AuthenticationEvent {
  final String userEmail;
  final String userPassword;
  const LoginStarted(this.userEmail, this.userPassword);
}

class RegistrationStarted extends AuthenticationEvent {
  final String userEmail;
  final String userPassword;
  const RegistrationStarted(this.userEmail, this.userPassword);
}
