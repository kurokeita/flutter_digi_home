import 'package:get/get.dart';

class GetStartedController extends GetxController {
  var countryCode = '84'.obs;
  var phone = ''.obs;
  var password = ''.obs;
  var verified = 0.obs;
  var loading = false.obs;

  void changeCountryCode(String countryCode) => this.countryCode.value = countryCode;

  void changePhone(String phone) {
    this.phone.value = phone;
    verified.value = 0;
  }

  void changePassword(String password) {
    this.password.value = password;
  }

  void changeVerifiedStatus(bool status) {
    if (status) {
      verified.value = 2;
    } else {
      verified.value = 1;
    }
  }

  void changeLoadingStatus() {
    loading.value = !loading.value;
  }
}