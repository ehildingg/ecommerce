part of 'authentication_bloc.dart';

@immutable
class AuthenticationState {
  const AuthenticationState({
    this.data,
    this.error,
    this.isLoading = false,
  });

  final UserSingleton? data;
  final UserException? error;
  final bool isLoading;

  AuthenticationState copyWith({
    UserSingleton? data,
    UserException? error,
    bool? isLoading,
  }) {
    return AuthenticationState(
      data: data ?? this.data,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AuthenticationState &&
        other.data == data &&
        other.error == error &&
        other.isLoading == isLoading;
  }

  @override
  int get hashCode => Object.hash(data, error, isLoading);

  @override
  String toString() {
    return 'ShapeState(data: $data, error: $error, isLoading: $isLoading)';
  }
}

class UserException implements Exception {
  @override
  String toString() => 'Error while loading user.';
}

class Authenticated extends AuthenticationState {}
