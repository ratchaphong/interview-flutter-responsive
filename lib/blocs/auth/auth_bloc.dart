import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_responsive/model/auth.dart';
import 'package:flutter_responsive/repository/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;

  AuthBloc(this.repository) : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        Data? res = await repository.login(event.email, event.password);
        event.onCallback(res?.token);
        emit(AuthFinish(res!));
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
        emit(AuthError(e.toString()));
      }
    });

    on<CheckTokenEvent>((event, emit) async {
      bool isLogin = false;
      emit(AuthLoading());
      try {
        bool isLoggedIn = await _getLoggedInStatus();
        if (isLoggedIn) {
          String token = await _getTokenStatus();
          Data? res = await repository.checkToken(token);
          emit(AuthFinish(res!));
          isLogin = true;
        } else {
          emit(AuthError("it doesn't allow."));
        }
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
        emit(AuthError(e.toString()));
      } finally {
        event.onCallback(isLogin);
      }
    });

    on<SignUpEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        await repository.signup(event.name, event.password, event.email);
        event.onCallback();
        emit(SignUpFinish());
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
        emit(AuthError(e.toString()));
      }
    });

    on<LogoutEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        _storeLoggedInStatus(false);
        emit(LogoutFinish());
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
        emit(AuthError(e.toString()));
      }
    });
  }
}

Future _storeLoggedInStatus(bool isLoggedIn, [String? token]) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setBool('isLoggedIn', isLoggedIn);
  if (token != null) {
    pref.setString('token', token);
  } else {
    pref.setString('token', "");
  }
}

Future<bool> _getLoggedInStatus() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getBool('isLoggedIn') ?? false;
}

Future<String> _getTokenStatus() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString('token') ?? "";
}
