import 'package:dartz/dartz.dart';
import 'package:pos_flutter/core/usecases/usecases.dart';
import 'package:pos_flutter/features/order/domain/entities/filter_order_params.dart';
import 'package:pos_flutter/features/order/domain/entities/order_detail_response.dart';
import 'package:pos_flutter/features/order/domain/entities/order_details.dart';

import '../../../../core/error/failures.dart';

abstract class OrderRepository {
  Future<Either<Failure, bool>> addOrder(OrderDetailResponse params);
  Future<Either<Failure, List<OrderDetails>>> getRemoteOrders(
      FilterOrderParams params);
  Future<Either<Failure, List<OrderDetails>>> getCachedOrders();
  Future<Either<Failure, NoParams>> clearLocalOrders();
}
