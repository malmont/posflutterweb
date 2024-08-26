import 'dart:convert';

import 'package:pos_flutter/features/authentification/domain/entities/user.dart';


UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"].toString(), 
    firstName: json["firstName"] ?? '', 
    lastName: json["lastName"] ?? '',  
    email: json["email"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
  };
}
