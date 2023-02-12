part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);
}

class AuthFinish extends AuthState {
  final Data auth;

  AuthFinish(this.auth);
}

class LogoutFinish extends AuthState {}

class SignUpFinish extends AuthState {}

class CheckTokenFinish extends AuthFinish {
  CheckTokenFinish(super.auth);
}
