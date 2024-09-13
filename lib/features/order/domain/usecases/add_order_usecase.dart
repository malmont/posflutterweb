import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pos_flutter/core/error/failures.dart';
import 'package:pos_flutter/core/usecases/usecases.dart';
import 'package:pos_flutter/features/order/domain/entities/order_detail_response.dart';
import 'package:pos_flutter/features/order/domain/repositories/order_repository.dart';

@lazySingleton
class AddOrderUseCase implements UseCase<bool, OrderDetailResponse> {
  final OrderRepository repository;
  AddOrderUseCase(this.repository);

  @override
  Future<Either<Failure, bool>> call(OrderDetailResponse params) async {
    return await repository.addOrder(params);
  }
}
