import 'package:flutter_getx/models/house/house.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var count = 0.obs;
  var houses = List<House>().obs;

  increment() => count++;

  void setHouses(List<House> houses) => this.houses.assignAll(houses);
}