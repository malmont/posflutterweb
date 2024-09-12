import 'package:dartz/dartz.dart';
import 'package:pos_flutter/features/cart/domain/entities/cart_item.dart';

import '../../../../core/error/failures.dart';

abstract class CartRepository {
  Future<Either<Failure, List<CartItem>>> getCachedCart();
  Future<Either<Failure, CartItem>> addToCart(CartItem params);
  Future<Either<Failure, bool>> clearCart();
  Future<Either<Failure, void>> removeFromCart(CartItem params);
}
