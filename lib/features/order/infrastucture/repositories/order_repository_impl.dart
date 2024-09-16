import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pos_flutter/core/error/exeptions.dart';
import 'package:pos_flutter/core/network/network_info.dart';
import 'package:pos_flutter/core/services/data_sources/local/order_local_data_source.dart';
import 'package:pos_flutter/core/services/data_sources/local/user_local_data_source.dart';
import 'package:pos_flutter/core/services/data_sources/remote/order_remote_data_source.dart';
import 'package:pos_flutter/core/usecases/usecases.dart';
import 'package:pos_flutter/features/order/domain/entities/filter_order_params.dart';
import 'package:pos_flutter/features/order/domain/entities/order_detail_response.dart';
import 'package:pos_flutter/features/order/domain/entities/order_details.dart';
import 'package:pos_flutter/features/order/domain/repositories/order_repository.dart';
import 'package:pos_flutter/features/order/infrastucture/models/order_detail_response_model.dart';

import '../../../../core/error/failures.dart';

@LazySingleton(as: OrderRepository)
class OrderRepositoryImpl implements OrderRepository {
  final OrderRemoteDataSource remoteDataSource;
  final OrderLocalDataSource localDataSource;
  final UserLocalDataSource userLocalDataSource;
  final NetworkInfo networkInfo;

  OrderRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.userLocalDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, bool>> addOrder(OrderDetailResponse params) async {
    if (await userLocalDataSource.isTokenAvailable()) {
      try {
        final remoteProduct = await remoteDataSource.addOrder(
          OrderDetailResponseModel.fromEntity(params),
        );
        return Right(remoteProduct);
      } on ServerException {
        return Left(ServerFailure());
      } catch (e) {
        return Left(UnknownFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, List<OrderDetails>>> getRemoteOrders(
      FilterOrderParams params) async {
    if (await networkInfo.isConnected) {
      if (await userLocalDataSource.isTokenAvailable()) {
        try {
          final remoteProduct = await remoteDataSource.getOrders(params);
          await localDataSource.saveOrders(remoteProduct);
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
  Future<Either<Failure, List<OrderDetails>>> getCachedOrders() async {
    try {
      final localOrders = await localDataSource.getOrders();
      return Right(localOrders);
    } on Failure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, NoParams>> clearLocalOrders() async {
    try {
      await localDataSource.clearOrder();
      return Right(NoParams());
    } on Failure catch (failure) {
      return Left(failure);
    }
  }
}
