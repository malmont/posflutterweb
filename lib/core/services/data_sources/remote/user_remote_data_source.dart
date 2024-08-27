
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:pos_flutter/core/error/exeptions.dart';
import 'package:pos_flutter/core/error/failures.dart';
import 'package:pos_flutter/features/authentification/domain/usecases/sign_in_usecase.dart';
import 'package:pos_flutter/features/authentification/infrastucture/models/user/authentication_response_model.dart';

abstract class UserRemoteDataSource {
  Future<AuthenticationResponseModel> signIn(SignInParams params);

}
@LazySingleton(as: UserRemoteDataSource)
class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final http.Client client;
  UserRemoteDataSourceImpl({required this.client});

 @override
Future<AuthenticationResponseModel> signIn(SignInParams params) async {
  try {
  final response = await client.post(
    Uri.parse('https://backend-strapi.online/jeesign/api/login'),
    headers: {
      'Content-Type': 'application/json',
    },
    body: json.encode({
      'username': params.username,
      'password': params.password,
    }),
  );

  if (response.statusCode == 200) {
    return authenticationResponseModelFromJson(response.body);
  } else if (response.statusCode == 400 || response.statusCode == 401) {
    throw CredentialFailure();
  } else {
    throw ServerException();
  }
} catch (e) {
  print('Erreur lors de la connexion: $e');
  throw ServerException();
}
}


 
}
