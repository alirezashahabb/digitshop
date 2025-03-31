import 'package:apple_shop/data/repository/auth_repositroy.dart';
import 'package:apple_shop/utils/di.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  //Feild Injection
  final IAuthRepositroy repositroy = locator.get();
  AuthBloc() : super(AuthInitSate()) {
    on<AuthEvent>(
      (event, emit) async {
        if (event is AuthLoginEvent) {
          emit(AuthLoadingSate());
          var reaponse = await repositroy.login(event.userName, event.password);
          emit(
            AutResponseState(response: reaponse),
          );
        }
        if (event is AuthSignInEvent) {
          emit(AuthLoadingSate());
          var reaponse = await repositroy.register(
            event.userName,
            event.password,
            event.confirmPassword,
          );
          emit(
            AutResponseState(response: reaponse),
          );
        }
      },
    );
  }
}
