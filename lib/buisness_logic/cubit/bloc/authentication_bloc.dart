import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:ecommerce/data/repositories/user_repository.dart';

import '../../../data/models/user_singleton.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(const AuthenticationState()) {
    on<LoginStarted>(_loginStarted);
    on<RegistrationStarted>(_registrationStarted);
    on<LogoutStarted>(_logoutStarted);
  }

  UserRepository userRepository = UserRepository();

  FutureOr<void> _loginStarted(
      LoginStarted event, Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(isLoading: true));

    try {
      await userRepository.loginUser(event.userEmail, event.userPassword);
      emit(Authenticated());
    } on UserException catch (e) {
      emit(state.copyWith(error: e));
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  FutureOr<void> _registrationStarted(
      RegistrationStarted event, Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(isLoading: true));

    try {
      await userRepository.registerUser(event.userEmail, event.userPassword);
      emit(Authenticated());
    } on UserException catch (e) {
      emit(state.copyWith(error: e));
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  FutureOr<void> _logoutStarted(
      LogoutStarted event, Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(isLoading: true));

    try {
      await userRepository.logoutUser();
      emit(UnAuthenticated());
    } on UserException catch (e) {
      emit(state.copyWith(error: e));
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}
