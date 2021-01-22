import 'package:get/get.dart';

class GetStartedController extends GetxController {
  var countryCode = '84'.obs;
  var phone = ''.obs;

  void changeCountryCode(String newCountryCode) => countryCode.value = newCountryCode;

  void changePhone(String newPhone) => phone.value = newPhone;
}