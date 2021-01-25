import 'package:flutter_getx/controllers/home/home_controller.dart';
import 'package:flutter_getx/services/apis/house/index_house/index_house.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(IndexHouseApi());
  }
}