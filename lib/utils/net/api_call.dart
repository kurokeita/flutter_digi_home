import 'package:http/http.dart' as http;

abstract class ApiCall {
  static var client = http.Client();

  Future<dynamic> post({String uri, body}) async {
    var response = await client.post(url(uri), body: body);

    return response;
  }

  String domain();

  String url(String uri) {
    return domain() + uri;
  }
}