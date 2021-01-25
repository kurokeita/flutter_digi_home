import 'package:flutter_getx/controllers/global_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

abstract class ApiCall {
  final globalController = Get.find<GlobalController>();
  static var client = http.Client();

  Future<dynamic> post({String uri, body}) async {
    var response = await client.post(url(uri), body: body, headers: headers());

    return response;
  }

  Future<dynamic> get({String uri, body}) async {
    var url = '';
    if (![null, '', false, 0].contains(body)) {
      url = (new Uri.http(this.url(uri), body)) as String;
    } else {
      url = this.url(uri);
    }
    var response = await client.get(url, headers: headers());
    
    return response;
  }

  String domain();

  String url(String uri) {
    return domain() + uri;
  }

  Map<String, String> headers() {
    return {
      'Authorization': "Bearer ${globalController.accessToken}",
      'Accept': 'application/json'
    };
  }
}