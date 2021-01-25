import 'package:flutter_getx/utils/net/api_call.dart';

class HouseApi extends ApiCall {
  @override
  String domain() {
    return "https://stg-digi-house.notifun.com";
  }
}