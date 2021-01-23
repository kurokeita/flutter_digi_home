// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Login _$LoginFromJson(Map<String, dynamic> json) {
  return Login(
    json['token_type'] as String,
    json['access_token'] as String,
    json['refresh_token'] as String,
  );
}

Map<String, dynamic> _$LoginToJson(Login instance) => <String, dynamic>{
      'token_type': instance.token_type,
      'access_token': instance.access_token,
      'refresh_token': instance.refresh_token,
    };
