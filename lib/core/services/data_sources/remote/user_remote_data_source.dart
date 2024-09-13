import 'package:dio/dio.dart';

import 'package:injectable/injectable.dart';
import 'package:pos_flutter/core/error/exeptions.dart';
import 'package:pos_flutter/core/services/data_sources/local/user_local_data_source.dart';
import 'package:pos_flutter/features/authentification/infrastucture/models/user/authentication_response_model.dart';
import 'package:pos_flutter/features/authentification/infrastucture/models/user/sign_in_params.dart';

import '../../api/user_api_client.dart';

abstract class UserRemoteDataSource {
  Future<AuthenticationResponseModel> signIn(SignInParams params);
}

@LazySingleton(as: UserRemoteDataSource)
class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final UserApiClient apiClient;
  final UserLocalDataSource userLocalDataSource;

  UserRemoteDataSourceImpl(
      {required this.apiClient, required this.userLocalDataSource});

  @override
  Future<AuthenticationResponseModel> signIn(SignInParams params) async {
    try {
      final response = await apiClient.signIn(params);
      return response;
    } catch (e) {
      if (e is DioException) {
        print('Erreur lors de l\'authentification: ${e.response?.statusCode}');
      }
      throw ServerException();
    }
  }
}
