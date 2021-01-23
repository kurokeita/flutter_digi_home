import 'package:json_annotation/json_annotation.dart';

part 'login.g.dart';

@JsonSerializable()
class Login {
  // ignore: non_constant_identifier_names
  String token_type;
  // ignore: non_constant_identifier_names
  String access_token;
  // ignore: non_constant_identifier_names
  String refresh_token;

  Login(this.token_type, this.access_token, this. refresh_token);

  factory Login.fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);

  Map<String, dynamic> toJson() => _$LoginToJson(this);
}