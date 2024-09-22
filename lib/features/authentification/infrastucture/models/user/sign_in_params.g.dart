// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInParams _$SignInParamsFromJson(Map<String, dynamic> json) => SignInParams(
      username: json['username'] as String,
      password: json['password'] as String,
      platform: json['platform'] as String? ?? 'mobile',
    );

Map<String, dynamic> _$SignInParamsToJson(SignInParams instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'platform': instance.platform,
    };
