import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pos_flutter/core/usecases/usecases.dart';
import 'package:pos_flutter/features/cart/domain/entities/cart_item.dart';
import 'package:pos_flutter/features/cart/domain/repositories/cart_repository.dart';

import '../../../../../core/error/failures.dart';

@lazySingleton
class GetCachedCartUseCase implements UseCase<List<CartItem>, NoParams> {
  final CartRepository repository;
  GetCachedCartUseCase(this.repository);

  @override
  Future<Either<Failure, List<CartItem>>> call(NoParams params) async {
    return await repository.getCachedCart();
  }
}
