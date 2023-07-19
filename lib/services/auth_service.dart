import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/error_response.dart';
import '../model/login_response.dart';

class AuthService {
  static var client = http.Client();
  static final _baseURL = Uri.parse("http://127.0.0.1:8000/api");

  static Future<List> login(
      {required String email, required String password}) async {
    var response = await client.post(Uri.parse("$_baseURL/auth/login"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body:
            jsonEncode(<String, String>{"email": email, "password": password}));

    if (response.statusCode == 200) {
      String json = response.body;
      var loginRes = loginRespFromJson(json);
      if (loginRes != null) {
        return [loginRes.accessToken, ""];
      } else {
        return ["", "Unknown Error"];
      }
    } else {
      var json = response.body;
      ErrorResp? errorResp;
      try {
        try {
          errorResp = errorRespFromJson(json);
        } catch (e) {
          errorResp = errorRespFromJson2(json);
        }
      } catch (e) {
        errorResp = null;
      }
      if (errorResp == null) {
        return ["", "Unknown Error"];
      } else {
        return ["", errorResp.error];
      }
    }
  }
}
