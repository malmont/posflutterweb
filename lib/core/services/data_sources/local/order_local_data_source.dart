import 'package:injectable/injectable.dart';
import 'package:pos_flutter/core/error/failures.dart';
import 'package:pos_flutter/features/order/infrastucture/models/order_details_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class OrderLocalDataSource {
  Future<List<OrderDetailsModel>> getOrders();
  Future<void> saveOrders(List<OrderDetailsModel> params);
  Future<void> clearOrder();
}

const cachedOrders = 'CACHED_ORDERS';

@LazySingleton(as: OrderLocalDataSource)
class OrderLocalDataSourceImpl implements OrderLocalDataSource {
  final SharedPreferences sharedPreferences;
  OrderLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<OrderDetailsModel>> getOrders() {
    final jsonString = sharedPreferences.getString(cachedOrders);
    if (jsonString != null) {
      return Future.value(orderDetailsModelListFromLocalJson(jsonString));
    } else {
      throw CacheFailure();
    }
  }

  @override
  Future<void> saveOrders(List<OrderDetailsModel> params) {
    return sharedPreferences.setString(
      cachedOrders,
      orderModelListToJson(params),
    );
  }

  @override
  Future<void> clearOrder() async {
    await sharedPreferences.remove(cachedOrders);
    return;
  }
}
