import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_responsive/model/auth.dart';
import 'package:flutter_responsive/repository/auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;

  AuthBloc(this.repository) : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        Data? res = await repository.login(event.email, event.password);
        emit(AuthFinish(res!));
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
        emit(AuthError(e.toString()));
      }
    });

    on<SignUpEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        await repository.signup(event.name, event.password, event.email);
        emit(SignUpFinish());
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
        emit(AuthError(e.toString()));
      }
    });
  }
}
