import 'dart:convert';

import 'package:pos_flutter/features/order/domain/entities/order_details.dart';
import 'order_item_model.dart';

List<OrderDetailsModel> orderDetailsModelListFromJson(String str) =>
    List<OrderDetailsModel>.from(
        json.decode(str).map((x) => OrderDetailsModel.fromJson(x)));

List<OrderDetailsModel> orderDetailsModelListFromLocalJson(String str) =>
    List<OrderDetailsModel>.from(
        json.decode(str).map((x) => OrderDetailsModel.fromJson(x)));

OrderDetailsModel orderDetailsModelFromJson(String str) =>
    OrderDetailsModel.fromJson(json.decode(str));

String orderModelListToJsonBody(List<OrderDetailsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJsonBody())));

String orderModelListToJson(List<OrderDetailsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

String orderDetailsModelToJson(OrderDetailsModel data) =>
    json.encode(data.toJsonBody());

class OrderDetailsModel extends OrderDetails {
  const OrderDetailsModel({
    required int id,
    required String reference,
    required num totalAmount,
    required String orderDate,
    required int userId,
    required int shippingAdress,
    required String orderSource,
    required List<OrderItemModel> orderItems,
  }) : super(
          id: id,
          reference: reference,
          totalAmount: totalAmount,
          orderDate: orderDate,
          userId: userId,
          shippingAdress: shippingAdress,
          orderSource: orderSource,
          orderItems: orderItems,
        );

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) =>
      OrderDetailsModel(
        id: json["id"],
        reference: json["reference"],
        totalAmount: json["totalAmount"],
        orderDate: json["orderDate"],
        userId: json["userId"],
        shippingAdress: json["shippingAdress"],
        orderSource: json["orderSource"],
        orderItems: List<OrderItemModel>.from(
            json["orderItems"].map((x) => OrderItemModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "reference": reference,
        "totalAmount": totalAmount,
        "orderDate": orderDate,
        "userId": userId,
        "shippingAdress": shippingAdress,
        "orderSource": orderSource,
        "orderItems": List<dynamic>.from(
            (orderItems as List<OrderItemModel>).map((x) => x.toJson())),
      };

  Map<String, dynamic> toJsonBody() => {
        "id": id,
        "reference": reference,
        "totalAmount": totalAmount,
        "orderDate": orderDate,
        "userId": userId,
        "shippingAdress": shippingAdress,
        "orderSource": orderSource,
        "orderItems": List<dynamic>.from(
            (orderItems as List<OrderItemModel>).map((x) => x.toJsonBody())),
      };

  factory OrderDetailsModel.fromEntity(OrderDetails entity) =>
      OrderDetailsModel(
          id: entity.id,
          reference: entity.reference,
          totalAmount: entity.totalAmount,
          orderDate: entity.orderDate,
          userId: entity.userId,
          shippingAdress: entity.shippingAdress,
          orderSource: entity.orderSource,
          orderItems: entity.orderItems
              .map((orderItem) => OrderItemModel.fromEntity(orderItem))
              .toList());
}
