import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pos_flutter/core/config/dio_config.dart';
import 'package:pos_flutter/core/services/api/user_api_client.dart';
import 'package:pos_flutter/core/services/data_sources/local/user_local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

@module
abstract class RegisterModule {

  @lazySingleton
  InternetConnectionChecker get internetConnectionChecker => InternetConnectionChecker();

  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @lazySingleton
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage();

  @lazySingleton
  http.Client get httpClient => http.Client();

  // Injecter Dio via DioConfig
  @lazySingleton
  Dio dio(UserLocalDataSource userLocalDataSource) {
    return DioConfig(userLocalDataSource).createDio(); // Utiliser DioConfig
  }

  // Enregistrer UserApiClient avec Retrofit et Dio
  @lazySingleton
  UserApiClient userApiClient(Dio dio) => UserApiClient(dio);
}
