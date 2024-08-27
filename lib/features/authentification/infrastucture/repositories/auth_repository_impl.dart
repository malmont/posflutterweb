// features/authentication/infrastructure/repositories/auth_repository_impl.dart
import 'package:dartz/dartz.dart';
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
      // Capture l'exception et retourne une Failure générique
      return Left(ExceptionFailure()); // Tu peux personnaliser le type de Failure ici si nécessaire
    }
  }
  @override
  Future<Either<Failure, NoParams>> signOut() async {
    try {
      await localDataSource.clearCache();
      return Right(NoParams());
    } on CacheFailure {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> isTokenValid() async {
    try {
      final tokenValid = await localDataSource.isTokenAvailable();
      if (!tokenValid) {
        await localDataSource.clearCache();
        return Right(false);
      }
      return Right(true);
    } catch (e) {
      return Left(CacheFailure());
    }
  }

Future<Either<Failure, User>> _authenticate(Future<AuthenticationResponseModel> Function() getDataSource) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteResponse = await getDataSource();
        localDataSource.saveToken(remoteResponse.token);
        localDataSource.saveUser(remoteResponse.user);
        return Right(remoteResponse.user);
      } catch (e) {
        return Left(ServerFailure()); // Échec au niveau du serveur
      }
    } else {
      return Left(NetworkFailure()); // Pas de connexion réseau
    }
  }
}

