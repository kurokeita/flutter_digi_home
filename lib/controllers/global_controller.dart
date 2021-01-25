import 'package:get/get.dart';

class GlobalController extends GetxController {
  var accessToken = ''.obs;
  var refreshToken = ''.obs;
  var loginStatus = false.obs;

  void setAccessToken(String token) => accessToken.value = token;

  void setRefreshToken(String token) => refreshToken.value = token;

  void setLoginStatus(bool status) => loginStatus.value = status;
}