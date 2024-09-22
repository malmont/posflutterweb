import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:pos_flutter/core/error/failures.dart';
import 'package:pos_flutter/core/services/data_sources/local/user_local_data_source.dart';

Future<Either<Failure, T>> executeApiCall<T>(Future<T> Function() apiCall,
    UserLocalDataSource userLocalDataSource) async {
  try {
    if (kIsWeb) {
      return Right(await apiCall());
    } else {
      if (await userLocalDataSource.isTokenAvailable()) {
        return Right(await apiCall());
      } else {
        return Left(AuthenticationFailure());
      }
    }
  } catch (e) {
    return Left(ServerFailure());
  }
}
