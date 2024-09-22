import 'package:json_annotation/json_annotation.dart';

part 'sign_in_params.g.dart';

@JsonSerializable()
class SignInParams {
  final String username;
  final String password;
  final String platform;

  const SignInParams({
    required this.username,
    required this.password,
    this.platform = 'mobile',
  });

  SignInParams copyWith({
    String? username,
    String? password,
    String? platform,
  }) {
    return SignInParams(
      username: username ?? this.username,
      password: password ?? this.password,
      platform: platform ?? this.platform,
    );
  }

  factory SignInParams.fromJson(Map<String, dynamic> json) =>
      _$SignInParamsFromJson(json);

  Map<String, dynamic> toJson() => _$SignInParamsToJson(this);
}
