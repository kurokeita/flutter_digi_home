import 'package:get/get.dart';

class GetStartedController extends GetxController {
  var countryCode = '84'.obs;
  var phone = ''.obs;
  var verified = 0.obs;

  void changeCountryCode(String newCountryCode) => countryCode.value = newCountryCode;

  void changePhone(String newPhone) {
    phone.value = newPhone;
    verified.value = 0;
  }

  void status(bool status) {
    if (status) {
      verified.value = 2;
    } else {
      verified.value = 1;
    }
  }
}