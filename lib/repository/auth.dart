import 'package:flutter_responsive/model/auth.dart';
import 'package:flutter_responsive/provider/auth.dart';

class AuthRepository {
  final AuthProvider provider;
  Data? authData;

  AuthRepository(this.provider);

  Future<Data?> login(
    String email,
    String password,
  ) async {
    authData = await provider
        .login(email, password, {"email": email, "password": password});
    return authData;
  }

  Future signup(
    String name,
    String password,
    String email,
  ) async {
    await provider.signup(name, password, email);
    return;
  }
}
