import 'package:json_annotation/json_annotation.dart';

part 'sign_in_params.g.dart';  // Indique à Dart de générer le fichier

@JsonSerializable()
class SignInParams {
  final String username;
  final String password;

  const SignInParams({
    required this.username,
    required this.password,
  });

  // Méthodes générées automatiquement pour la sérialisation JSON
  factory SignInParams.fromJson(Map<String, dynamic> json) => _$SignInParamsFromJson(json);
  Map<String, dynamic> toJson() => _$SignInParamsToJson(this);
}
