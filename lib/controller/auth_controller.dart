import 'package:ecommerces/services/auth_service.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  RxBool loginProcess = false.obs;
  var error = "";
  var tempToken = "";
  Future<String> login(
      {required String email, required String password}) async {
    error = "";
    try {
      loginProcess(true);
      List loginResp =
          await AuthService.login(email: email, password: password);
      if (loginResp[0] != "") {
        //success
        final prefs = await SharedPreferences.getInstance();
        prefs.setString("access_token", loginResp[0]);
        tempToken = loginResp[0];
      } else {
        error = loginResp[1];
      }
    } finally {
      loginProcess(false);
    }
    return error;
  }

  Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("access_token") ?? "";
  }
}
