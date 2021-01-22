import 'package:json_annotation/json_annotation.dart';

part 'phone_look_up.g.dart';

@JsonSerializable()
class PhoneLookUp {
  // ignore: non_constant_identifier_names
  String country_code;
  String phone;
  bool verified;

  PhoneLookUp(this.country_code, this.phone, this.verified);

  factory PhoneLookUp.fromJson(Map<String, dynamic> json) =>  _$PhoneLookUpFromJson(json);

  Map<String, dynamic> toJson() => _$PhoneLookUpToJson(this);
}