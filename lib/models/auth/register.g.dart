// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Register _$RegisterFromJson(Map<String, dynamic> json) {
  return Register(
    json['id'] as int,
    json['uuid'] as String,
    json['name'] as String,
    json['phone'] as String,
  );
}

Map<String, dynamic> _$RegisterToJson(Register instance) => <String, dynamic>{
      'id': instance.id,
      'uuid': instance.uuid,
      'name': instance.name,
      'phone': instance.phone,
    };
