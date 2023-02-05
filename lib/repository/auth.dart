import 'package:flutter_responsive/model/auth.dart';
import 'package:flutter_responsive/provider/auth.dart';

class AuthRepository {
  final AuthProvider provider;
  Data? authData;

  AuthRepository(this.provider);

  Future<Data?> login(
    String userName,
    String password,
  ) async {
    authData = await provider
        .login(userName, password, {userName: userName, password: password});
    return authData;
  }
}
