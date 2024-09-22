import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pos_flutter/core/network/network_info.dart';
import 'package:pos_flutter/core/services/data_sources/local/cart_local_data_source.dart';
import 'package:pos_flutter/core/services/data_sources/local/user_local_data_source.dart';
import 'package:pos_flutter/features/cart/domain/entities/cart_item.dart';
import 'package:pos_flutter/features/cart/domain/repositories/cart_repository.dart';
import 'package:pos_flutter/features/cart/infrastucture/models/cart_item_model.dart';

import '../../../../core/error/failures.dart';

@LazySingleton(as: CartRepository)
class CartRepositoryImpl implements CartRepository {
  final CartLocalDataSource localDataSource;
  final UserLocalDataSource userLocalDataSource;

  CartRepositoryImpl({
    required this.localDataSource,
    required this.userLocalDataSource,
  });

  @override
  Future<Either<Failure, CartItem>> addToCart(CartItem params) async {
    try {
      final List<CartItemModel> cartItems = await localDataSource.getCart();

      final existingItemIndex = cartItems.indexWhere(
        (item) =>
            item.product.id == params.product.id &&
            item.variant.id == params.variant.id,
      );

      if (existingItemIndex != -1) {
        final existingItem = cartItems[existingItemIndex];
        cartItems[existingItemIndex] = existingItem.copyWith(
          quantity: existingItem.quantity + 1,
        );
      } else {
        cartItems.add(CartItemModel.fromParent(params));
      }
      await localDataSource.saveCart(cartItems);
      return Right(params);
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> removeFromCart(CartItem params) async {
    try {
      final List<CartItemModel> cartItems = await localDataSource.getCart();
      final existingItemIndex = cartItems.indexWhere(
        (item) =>
            item.product.id == params.product.id &&
            item.variant.id == params.variant.id,
      );

      if (existingItemIndex != -1) {
        final existingItem = cartItems[existingItemIndex];
        if (existingItem.quantity > 1) {
          cartItems[existingItemIndex] = existingItem.copyWith(
            quantity: existingItem.quantity - 1,
          );
        } else {
          cartItems.removeAt(existingItemIndex);
        }

        await localDataSource.saveCart(cartItems);

        return const Right(null);
      } else {
        return Left(CacheFailure());
      }
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, List<CartItem>>> getCachedCart() async {
    try {
      final localProducts = await localDataSource.getCart();
      return Right(localProducts);
    } catch (failure) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> clearCart() async {
    bool result = await localDataSource.clearCart();
    if (result) {
      return Right(result);
    } else {
      return Left(CacheFailure());
    }
  }
}
