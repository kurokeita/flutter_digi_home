// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_look_up.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhoneLookUp _$PhoneLookUpFromJson(Map<String, dynamic> json) {
  return PhoneLookUp(
    json['country_code'] as String,
    json['phone'] as String,
    json['verified'] as bool,
  );
}

Map<String, dynamic> _$PhoneLookUpToJson(PhoneLookUp instance) =>
    <String, dynamic>{
      'country_code': instance.country_code,
      'phone': instance.phone,
      'verified': instance.verified,
    };
