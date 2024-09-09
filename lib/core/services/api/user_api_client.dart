import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:pos_flutter/features/authentification/infrastucture/models/user/sign_in_params.dart';
import 'package:pos_flutter/features/authentification/infrastucture/models/user/authentication_response_model.dart';

part 'user_api_client.g.dart';

@RestApi(baseUrl: '')
abstract class UserApiClient {
  factory UserApiClient(Dio dio, {String? baseUrl}) = _UserApiClient;

  @POST('/login')
  Future<AuthenticationResponseModel> signIn(@Body() SignInParams params);
}
