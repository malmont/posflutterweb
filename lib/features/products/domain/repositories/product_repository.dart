import 'package:dartz/dartz.dart';
import 'package:pos_flutter/features/products/domain/entities/product/filter_product_params.dart';

import '../../../../core/error/failures.dart';
import '../entities/product/product_response.dart';

abstract class ProductRepository {
  Future<Either<Failure, ProductResponse>> getProducts(
      FilterProductParams params);
}
