part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthLoadingSate extends AuthState {}

final class AuthInitSate extends AuthState {}

final class AutResponseState extends AuthState {
  final Either<String, String> response;

  AutResponseState({required this.response});
}

final class AutErrorSate extends AuthState {
  final String error;

  AutErrorSate({required this.error});
}
