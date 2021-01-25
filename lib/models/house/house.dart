import 'package:json_annotation/json_annotation.dart';

part 'house.g.dart';

@JsonSerializable()
class House {
  String id;
  String name;
  String code;
  // ignore: non_constant_identifier_names
  String phone_owner;
  // ignore: non_constant_identifier_names
  String building_id;

  House(this.id, this.name, this.code, this.phone_owner, this.building_id);

  factory House.fromJson(Map<String, dynamic> json) => _$HouseFromJson(json);

  Map<String, dynamic> toJson() => _$HouseToJson(this);
}