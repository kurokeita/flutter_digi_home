import 'package:get/get.dart';

class NavBarController extends GetxController {
  var pos = 0.obs;

  void setPos(index) => pos.value = index;
}