import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pos_flutter/core/error/failures.dart';
import 'package:pos_flutter/core/network/network_info.dart';
import 'package:pos_flutter/core/services/data_sources/local/caisse_local_data_source.dart';
import 'package:pos_flutter/core/services/data_sources/local/user_local_data_source.dart';
import 'package:pos_flutter/core/services/data_sources/remote/caisse_remote_datat_source.dart';
import 'package:pos_flutter/core/usecases/usecases.dart';
import 'package:pos_flutter/features/Caisse/domain/entities/caisse.dart';
import 'package:pos_flutter/features/Caisse/domain/repositories/caisse_repository.dart';

@LazySingleton(as: CaisseRepository)
class CaisseRepositoryImpl implements CaisseRepository {
  final CaisseRemoteDataSource remoteDataSource;
  final CaisseLocalDataSOurce localDataSource;
  final NetworkInfo networkInfo;
  final UserLocalDataSource userLocalDataSource;

  CaisseRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
    required this.userLocalDataSource,
  });

  @override
  Future<Either<Failure, bool>> closeCaisse(noParams) async {
    if (await userLocalDataSource.isTokenAvailable()) {
      final remoteProduct = await remoteDataSource.closeCaise(noParams);
      return Right(remoteProduct);
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> depositCaisse(double amount) async {
    if (await userLocalDataSource.isTokenAvailable()) {
      final remoteProduct = await remoteDataSource.depositCaisse(amount);
      return Right(remoteProduct);
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, List<Caisse>>> getRemoteCaisse(int days) async {
    if (await networkInfo.isConnected) {
      if (await userLocalDataSource.isTokenAvailable()) {
        try {
          final remoteProduct = await remoteDataSource.getCaisse(days);
          await localDataSource.saveCaisse(remoteProduct);
          return Right(remoteProduct);
        } on Failure catch (failure) {
          return Left(failure);
        }
      } else {
        return Left(AuthenticationFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> openCaisse(noParams) async {
    if (await userLocalDataSource.isTokenAvailable()) {
      final remoteProduct = await remoteDataSource.openCaise(noParams);
      return Right(remoteProduct);
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> withdrawCaisse(double amount) async {
    if (await userLocalDataSource.isTokenAvailable()) {
      final remoteProduct = await remoteDataSource.withdrawCaisse(amount);
      return Right(remoteProduct);
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, List<Caisse>>> getCachedCaisse(noParams) async {
    try {
      final localCaisses = await localDataSource.getCaisse();
      return Right(localCaisses);
    } on Failure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, NoParams>> clearLocalCaisse(noParams) async {
    try {
      await localDataSource.clearCaisse();
      return Right(NoParams());
    } on Failure catch (failure) {
      return Left(failure);
    }
  }
}
