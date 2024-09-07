import 'package:dio/dio.dart' hide Headers;  // Masque 'Headers' de Dio
import 'package:retrofit/retrofit.dart';  // Garde 'Headers' de Retrofit
import 'package:pos_flutter/features/authentification/infrastucture/models/user/sign_in_params.dart';
import 'package:pos_flutter/features/authentification/infrastucture/models/user/authentication_response_model.dart';


part 'user_api_client.g.dart';

@RestApi(baseUrl: "https://backend-strapi.online/jeesign/api")
abstract class UserApiClient {
  factory UserApiClient(Dio dio, {String? baseUrl}) = _UserApiClient;

  @POST('/login')
  Future<AuthenticationResponseModel> signIn(@Body() SignInParams params);
}