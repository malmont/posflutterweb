// features/authentication/infrastructure/repositories/auth_repository_impl.dart
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pos_flutter/core/error/failures.dart';
import 'package:pos_flutter/core/network/network_info.dart';
import 'package:pos_flutter/core/services/data_sources/local/user_local_data_source.dart';
import 'package:pos_flutter/core/services/data_sources/remote/user_remote_data_source.dart';
import 'package:pos_flutter/core/usecases/usecases.dart';
import 'package:pos_flutter/features/authentification/domain/entities/user.dart';
import 'package:pos_flutter/features/authentification/domain/repositories/auth_repository.dart';
import 'package:pos_flutter/features/authentification/infrastucture/models/user/authentication_response_model.dart';

typedef _DataSourceChooser = Future<AuthenticationResponseModel> Function();

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final UserRemoteDataSource remoteDataSource;
  final UserLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, User>> signIn(params) async {
    try {
      return await _authenticate(() {
        return remoteDataSource.signIn(params);
      });
    } catch (e) {
      return Left(ExceptionFailure());
    }
  }

  @override
  Future<Either<Failure, NoParams>> signOut() async {
    try {
      if (kIsWeb) {
        final response = await remoteDataSource.signOut();
        if (!response) {
          return Left(ServerFailure());
        }
      }
      await localDataSource.clearCache();
      return Right(NoParams());
    } on CacheFailure {
      return Left(CacheFailure());
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> isTokenValid() async {
    try {
      if (kIsWeb) {
        try {
          final tokenValid = await remoteDataSource.isTokenValid();

          if (tokenValid) {
            return const Right(true);
          } else {
            print('Token expiré, tentative de rafraîchissement via cookies.');
            try {
              final refreshResponse = await remoteDataSource.refreshToken();
              if (refreshResponse != null) {
                print('Token rafraîchi avec succès.');
                return const Right(true);
              } else {
                print('Échec du rafraîchissement du token.');
                return const Right(false);
              }
            } catch (refreshError) {
              print('Erreur lors du rafraîchissement du token : $refreshError');
              return const Right(false);
            }
          }
        } catch (e) {
          print('Erreur lors de la validation du token : $e');
          return const Right(false);
        }
      } else {
        final tokenValid = await localDataSource.isTokenAvailable();
        if (!tokenValid) {
          await localDataSource.clearCache();
          return const Right(false);
        }
        return const Right(true);
      }
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  Future<Either<Failure, User>> _authenticate(
      Future<AuthenticationResponseModel> Function() getDataSource) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteResponse = await getDataSource();
        localDataSource.saveUser(remoteResponse.user);
        if (!kIsWeb) {
          localDataSource.saveToken(remoteResponse.token);
        }
        return Right(remoteResponse.user);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
