part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  LoginEvent(this.email, this.password);
}

class LogoutEvnet extends AuthEvent {}

class SignUpEvent extends AuthEvent {
  final String name;
  final String password;
  final String email;

  SignUpEvent(this.name, this.password, this.email);
}
