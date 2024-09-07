import 'package:dio/dio.dart';
import 'package:pos_flutter/core/services/data_sources/local/user_local_data_source.dart';
import 'bearer_token_interceptor.dart';

class DioConfig {
  final UserLocalDataSource userLocalDataSource;

  DioConfig(this.userLocalDataSource);

  Dio createDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://backend-strapi.online/jeesign/api/',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );

    // Ajouter l'interceptor du token
    dio.interceptors.add(BearerTokenInterceptor(userLocalDataSource));

    // Ajouter un LogInterceptor pour le débogage
    dio.interceptors.add(LogInterceptor( requestBody: true,
  responseBody: true,
  requestHeader: true,
  responseHeader: true,));

    return dio;
  }
}
