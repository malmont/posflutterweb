import 'package:dio/dio.dart';
import 'package:pos_flutter/core/services/data_sources/local/user_local_data_source.dart';


class BearerTokenInterceptor extends Interceptor {
  final UserLocalDataSource userLocalDataSource;

  BearerTokenInterceptor(this.userLocalDataSource);

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.path != '/login') {
      final token = await userLocalDataSource.getToken();
      if (token != null) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    }

    return handler.next(options);
  }
}
