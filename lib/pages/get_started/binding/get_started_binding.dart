import 'package:flutter_getx/pages/get_started/controller/get_started_controller.dart';
import 'package:flutter_getx/pages/get_started/controller/log_in_controller.dart';
import 'package:flutter_getx/services/apis/auth/get_started/get_started.dart';
import 'package:flutter_getx/services/apis/auth/login/login.dart';
import 'package:flutter_getx/services/apis/auth/register/register.dart';
import 'package:get/get.dart';

class GetStartedBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(GetStartedController());
    // Get.put(LoginController());
    Get.put(GetStartedApi());
    Get.put(RegisterApi());
    Get.put(LoginApi());
  }

}