import 'dart:convert';
import 'dart:io';

import 'package:flutter_getx/models/auth/register.dart';
import 'package:flutter_getx/services/apis/auth/auth_api.dart';
import 'package:flutter_getx/utils/toast/toast.dart';

class RegisterApi extends AuthApi {
  String uri = '/oauth/register';

  Future<dynamic> register({String countryCode, String phone}) async {
    Map body = {
      'country_code': countryCode,
      'phone': phone
    };

    var response = await post(uri: uri, body: body);

    Map<String, dynamic> data = jsonDecode(response.body);

    if (response.statusCode == HttpStatus.ok) {
      Register registerData = Register.fromJson(data['data']);
      if (data.containsKey('password')) {
        Toast.toast("${data['password']}");
      }
      return registerData;
    } else {
      Toast.toast(data['message']);
      return null;
    }
  }
}