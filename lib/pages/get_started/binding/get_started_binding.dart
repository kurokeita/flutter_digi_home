import 'package:flutter_getx/pages/get_started/controller/get_started_controller.dart';
import 'package:flutter_getx/services/apis/auth/get_started/get_started.dart';
import 'package:get/get.dart';

class GetStartedBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(GetStartedController());
    Get.put(GetStartedApi());
  }

}