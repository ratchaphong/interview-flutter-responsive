part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

// ignore: must_be_immutable
class LoginEvent extends AuthEvent {
  final String email;
  final String password;
  Function(String? token) onCallback;

  LoginEvent(
    this.email,
    this.password,
    this.onCallback,
  );
}

class CheckTokenEvent extends AuthEvent {
  final Function(bool isLogin) onCallback;

  CheckTokenEvent(this.onCallback);
}

class SignUpEvent extends AuthEvent {
  final String name;
  final String password;
  final String email;
  final Function() onCallback;

  SignUpEvent(
    this.name,
    this.password,
    this.email,
    this.onCallback,
  );
}

class LogoutEvent extends AuthEvent {}
