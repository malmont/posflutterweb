import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pos_flutter/core/error/exeptions.dart';
import 'package:pos_flutter/core/error/failures.dart';
import 'package:pos_flutter/core/network/network_info.dart';
import 'package:pos_flutter/core/services/data_sources/local/product_local_data_source.dart';
import 'package:pos_flutter/core/services/data_sources/remote/product_remote-data_sourceImpl.dart';
import 'package:pos_flutter/features/products/domain/entities/product/filter_product_params.dart';
import 'package:pos_flutter/features/products/domain/entities/product/product_response.dart';
import 'package:pos_flutter/features/products/domain/repositories/product_repository.dart';
import 'package:pos_flutter/features/products/infrastucture/models/product/product_response_model.dart';

typedef _ConcreteOrProductChooser = Future<ProductResponse> Function();

@LazySingleton(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;
  final ProductLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  ProductRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, ProductResponse>> getProducts(
      FilterProductParams params) async {
    return await _getProducts(() {
      return remoteDataSource.getProducts(params);
    });
  }

  Future<Either<Failure, ProductResponse>> _getProducts(
      _ConcreteOrProductChooser getConcreteOrProduct) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteProducts = await getConcreteOrProduct();
        localDataSource.saveProducts(remoteProducts as ProductResponseModel);
        return Right(remoteProducts);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localProducts = await localDataSource.getLastProducts();
        return Right(localProducts);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
