import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pos_flutter/core/error/failures.dart';
import 'package:pos_flutter/core/usecases/usecases.dart';
import 'package:pos_flutter/features/order/domain/entities/filter_order_params.dart';
import 'package:pos_flutter/features/order/domain/entities/order_details.dart';
import 'package:pos_flutter/features/order/domain/repositories/order_repository.dart';

@lazySingleton
class GetRemoteOrdersUseCase
    implements UseCase<List<OrderDetails>, FilterOrderParams> {
  final OrderRepository repository;
  GetRemoteOrdersUseCase(this.repository);

  @override
  Future<Either<Failure, List<OrderDetails>>> call(
      FilterOrderParams params) async {
    return await repository.getRemoteOrders(params);
  }
}
