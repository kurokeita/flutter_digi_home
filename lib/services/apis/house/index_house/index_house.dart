import 'dart:convert';
import 'dart:io';

import 'package:flutter_getx/models/house/house.dart';
import 'package:flutter_getx/services/apis/house/house_api.dart';
import 'package:flutter_getx/utils/toast/toast.dart';
import 'package:logger/logger.dart';

class IndexHouseApi extends HouseApi {
  String uri = '/api/user/houses';

  Future<dynamic> index() async {
    var response = await get(uri: uri);
    final logger = Logger();

    Map<String, dynamic> data = jsonDecode(response.body);

    if (response.statusCode == HttpStatus.ok) {
      String housesData = jsonEncode(data['data']);
      List<House> houses = housesFromJson(housesData);
      logger.d(houses);
    } else {
      Toast.toast(data['message']);
    }
  }

  List<House> housesFromJson(String json) => List<House>.from(jsonDecode(json).map((house) => House.fromJson(house)));
}