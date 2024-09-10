import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:pos_flutter/core/error/exeptions.dart';
import 'package:pos_flutter/features/products/infrastucture/models/product/product_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ProductLocalDataSource {
  Future<ProductResponseModel> getLastProducts();
  Future<void> saveProducts(ProductResponseModel productsToCache);
}

const cachedProducts = 'CACHED_PRODUCTS';

@LazySingleton(as: ProductLocalDataSource)
class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  final SharedPreferences sharedPreferences;

  ProductLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<ProductResponseModel> getLastProducts() {
    final jsonString = sharedPreferences.getString(cachedProducts);
    if (jsonString != null) {
      return Future.value(productResponseModelFromJson(jsonDecode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> saveProducts(ProductResponseModel productsToCache) {
    final List<Map<String, dynamic>> products = [];
    return sharedPreferences.setString(
      cachedProducts,
      json.encode(products),
    );
  }
}
