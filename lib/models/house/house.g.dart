// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'house.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

House _$HouseFromJson(Map<String, dynamic> json) {
  return House(
    json['id'] as String,
    json['name'] as String,
    json['code'] as String,
    json['phone_owner'] as String,
    json['building_id'] as String,
  );
}

Map<String, dynamic> _$HouseToJson(House instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'phone_owner': instance.phone_owner,
      'building_id': instance.building_id,
    };
