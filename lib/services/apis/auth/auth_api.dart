import 'package:flutter_getx/utils/net/api_call.dart';

class AuthApi extends ApiCall {
  @override
  String domain() {
    return "https://stg-digi-auth.notifun.com";
  }
}