import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pos_flutter/core/services/data_sources/local/user_local_data_source.dart';

class BearerTokenInterceptor extends Interceptor {
  final UserLocalDataSource userLocalDataSource;

  BearerTokenInterceptor(this.userLocalDataSource);

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final excludedPaths = ['/login', '/products/'];
    final isExcluded =
        excludedPaths.any((path) => options.path.startsWith(path));
    if (!isExcluded && !kIsWeb) {
      final token = await userLocalDataSource.getToken();
      if (token != null) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    }
    return handler.next(options);
  }
}
