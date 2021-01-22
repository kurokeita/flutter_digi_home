import 'package:dio/dio.dart';

class GetStartedService {
  Dio dio;

  Future<Response> lookUp(String countryCode, String phone) async {
    Response response;
    response = await dio.post(
      "https://stg-digi-auth.notifun.com/oauth/lookup",
      queryParameters: {
        'country_code': countryCode,
        'phone': phone
      }
    );

    return response;
  }
}