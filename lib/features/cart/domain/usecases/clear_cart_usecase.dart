import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pos_flutter/core/usecases/usecases.dart';
import 'package:pos_flutter/features/cart/domain/repositories/cart_repository.dart';

import '../../../../../core/error/failures.dart';

@lazySingleton
class ClearCartUseCase implements UseCase<bool, NoParams> {
  final CartRepository repository;
  ClearCartUseCase(this.repository);

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await repository.clearCart();
  }
}
