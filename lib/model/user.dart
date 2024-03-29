import 'package:shared_preferences/shared_preferences.dart';

class User {
  static Future<String> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('access_token') ?? '';
  }
}
