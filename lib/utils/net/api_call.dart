import 'package:http/http.dart' as http;

abstract class ApiCall {
  static var client = http.Client();

  Future<dynamic> post({String uri, body}) async {
    var response = await client.post(url(uri), body: body);

    return response;
  }

  Future<dynamic> get({String uri, body}) async {
    var url = new Uri.http(this.url(uri), body);
    var response = await client.get(url);
    
    return response;
  }

  String domain();

  String url(String uri) {
    return domain() + uri;
  }
}