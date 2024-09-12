import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pos_flutter/core/usecases/usecases.dart';
import 'package:pos_flutter/features/cart/domain/entities/cart_item.dart';
import 'package:pos_flutter/features/cart/domain/repositories/cart_repository.dart';

import '../../../../../core/error/failures.dart';

@lazySingleton
class RemoveCartUseCase implements UseCase<void, CartItem> {
  final CartRepository repository;
  RemoveCartUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(CartItem params) async {
    return await repository.removeFromCart(params);
  }
}
