import 'package:get/get.dart';

class LoginController extends GetxController {
  var accessToken = ''.obs;
  var refreshToken = ''.obs;
  var loggedIn = false.obs;

  void setAccessToken(String token) => this.accessToken.value = token;

  void setRefreshToken(String token) => this.refreshToken.value = token;

  void setLoggedInStatus(bool status) => this.loggedIn.value = status;
}