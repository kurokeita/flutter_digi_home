import 'dart:convert';
import 'dart:io';
import 'package:flutter_getx/services/apis/auth/auth_api.dart';
import 'package:logger/logger.dart';
import 'package:flutter_getx/utils/toast/toast.dart';
import 'package:flutter_getx/models/auth/phone_look_up.dart';

class GetStartedApi extends AuthApi {
  String uri = '/oauth/lookup';
  final logger = Logger();

  Future<dynamic> lookUp({String countryCode, String phone}) async {
    Map body = {
      'country_code': countryCode,
      'phone': phone
    };
    var response = await post(uri: uri, body: body);

    var data = jsonDecode(response.body);

    if (response.statusCode == HttpStatus.ok) {
      PhoneLookUp phoneLookUp = PhoneLookUp.fromJson(data['data']);
      Toast.toast(phoneLookUp.verified ? 'Phone verified' : 'Phone not verified');
      return phoneLookUp;
    } else {
      Toast.toast(data['message']);
      return null;
    }
  }
}