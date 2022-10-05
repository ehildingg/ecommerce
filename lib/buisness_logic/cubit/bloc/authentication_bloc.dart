import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce/data/repositories/user_repository.dart';
import 'package:meta/meta.dart';

import '../../../data/models/user_singleton.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(const AuthenticationState()) {
    on<LoginStarted>(_LoginStarted);
    on<RegistrationStarted>(_RegistrationStarted);
  }

  UserRepository userRepository = UserRepository();

  FutureOr<void> _LoginStarted(
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

  FutureOr<void> _RegistrationStarted(
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
}
