import 'package:injectable/injectable.dart';
import 'package:pos_flutter/core/error/exeptions.dart';
import 'package:pos_flutter/core/services/api/order_api_client.dart';
import 'package:pos_flutter/features/order/domain/entities/filter_order_params.dart';
import 'package:pos_flutter/features/order/infrastucture/models/order_detail_response_model.dart';
import 'package:pos_flutter/features/order/infrastucture/models/order_details_model.dart';
import 'package:retrofit/dio.dart';

abstract class OrderRemoteDataSource {
  Future<bool> addOrder(OrderDetailResponseModel params);
  Future<List<OrderDetailsModel>> getOrders(FilterOrderParams params);
}

@LazySingleton(as: OrderRemoteDataSource)
class OrderRemoteDataSourceImpl implements OrderRemoteDataSource {
  final OrderApiClient apiClient;

  OrderRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<bool> addOrder(OrderDetailResponseModel params) async {
    try {
      final HttpResponse response = await apiClient.createOrder(params);
      if (response.response.statusCode == 201) {
        return true;
      }
      return false;
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<OrderDetailsModel>> getOrders(FilterOrderParams params) async {
    final int orderSource =
        params.orderSource != null && params.orderSource! > 0
            ? params.orderSource!
            : 1;
    final int days = params.days != null && params.days! > 0 ? params.days! : 7;
    try {
      final response = await apiClient.getOrders(
        orderSource,
        days,
      );
      return response;
    } catch (e) {
      throw ServerException();
    }
  }
}
