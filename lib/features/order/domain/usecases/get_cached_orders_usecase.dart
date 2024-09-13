import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pos_flutter/core/error/failures.dart';
import 'package:pos_flutter/core/usecases/usecases.dart';
import 'package:pos_flutter/features/order/domain/entities/order_details.dart';
import 'package:pos_flutter/features/order/domain/repositories/order_repository.dart';

@lazySingleton
class GetCachedOrdersUseCase implements UseCase<List<OrderDetails>, NoParams> {
  final OrderRepository repository;
  GetCachedOrdersUseCase(this.repository);

  @override
  Future<Either<Failure, List<OrderDetails>>> call(NoParams params) async {
    return await repository.getCachedOrders();
  }
}
