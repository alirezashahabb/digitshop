part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class AuthLoginEvent extends AuthEvent {
  final String userName;
  final String password;

  AuthLoginEvent({required this.userName, required this.password});
}

class AuthSignInEvent extends AuthEvent {
  final String userName;
  final String password;
  final String confirmPassword;

  AuthSignInEvent({
    required this.userName,
    required this.password,
    required this.confirmPassword,
  });
}
