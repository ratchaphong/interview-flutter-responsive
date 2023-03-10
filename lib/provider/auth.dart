import 'package:flutter/foundation.dart';
import 'package:flutter_responsive/model/auth.dart';
import 'package:http/http.dart' as http;

Data c = Data(
  id: 0,
  name: "muhammad",
  surname: "jarmann",
  occupation: 'Software Engineer',
  email: "mmjarmann@gmail.com",
  phoneNumber: "087415xxxx",
  address: "Vallalla Pakistan",
  token:
      "dedk21adsfa1ads1f3af13af13af13a13a1f3a13ds1f31d831fda3f4a61r31t31f31f3aff",
);

class AuthProvider {
  Future<Data> login(
    String email,
    String password,
    Map<String, String> mapData,
  ) async {
    try {
      if (kDebugMode) {
        print("auth provider: login\n$email\t$password\t$mapData");
      }
      // var url = Uri.https(
      //   'www.thecocktaildb.com',
      //   '/api/json/v1/1/search.php',
      // );
      // var r = await http.get(url);
      // if (r.statusCode != 200) {
      //   if (kDebugMode) {
      //     print("Error");
      //   }
      // }
      // var data = AuthModel.fromJson(r.body).data;
      // return data;
      return c;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      throw Exception(e.toString());
    } finally {}
  }

  Future signup(
    String name,
    String password,
    String email,
  ) async {
    try {
      if (kDebugMode) {
        print("auth provider: signup\n$name\t$password\t$email");
      }
      // var url = Uri.https(
      //   'www.thecocktaildb.com',
      //   '/api/json/v1/1/search.php',
      // );
      // var r = await http.get(url);
      // if (r.statusCode != 200) {
      //   if (kDebugMode) {
      //     print("Error");
      //   }
      // }
      // var data = AuthModel.fromJson(r.body).data;
      // return data;
      return;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      throw Exception(e.toString());
    } finally {}
  }

  Future<Data> checkToken(
    String token,
  ) async {
    try {
      if (kDebugMode) {
        print("auth provider: checkToken\n$token");
      }
      // var url = Uri.https(
      //   'www.thecocktaildb.com',
      //   '/api/json/v1/1/search.php',
      // );
      // var r = await http.get(url);
      // if (r.statusCode != 200) {
      //   if (kDebugMode) {
      //     print("Error");
      //   }
      // }
      // var data = AuthModel.fromJson(r.body).data;
      // return data;
      return c;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      throw Exception(e.toString());
    } finally {}
  }
}
