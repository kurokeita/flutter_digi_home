import 'dart:convert';
import 'dart:io';

import 'package:flutter_getx/models/auth/login.dart';
import 'package:flutter_getx/services/apis/auth/auth_api.dart';
import 'package:flutter_getx/utils/toast/toast.dart';
import 'package:get_storage/get_storage.dart';

class LoginApi extends AuthApi {
  String uri = '/oauth/token';
  String clientId = '12';
  String clientSecret = 'M77jixec90jjfmDjysk4vJwV8Yw5iUGBJu9UELvt';
  String grantType = 'password';

  Future<dynamic> login({String phone, String password}) async {
    Map body = {
      'username': phone,
      'password': password,
      'grant_type': this.grantType,
      'client_id': this.clientId,
      'client_secret': this.clientSecret
    };

    var response = await post(uri: uri, body: body);

    Map<String, dynamic> data = jsonDecode(response.body);

    if (response.statusCode == HttpStatus.ok) {
      Login loginData = Login.fromJson(data);

      final box = GetStorage();
      box.write('access_token', loginData.access_token);

      Toast.toast('Login success');

      return loginData;
    } else {
      Toast.toast(data['message']);

      return null;
    }
  }
}