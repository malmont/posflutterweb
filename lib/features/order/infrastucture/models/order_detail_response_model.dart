import 'dart:convert';

import 'package:pos_flutter/features/order/domain/entities/order_detail_response.dart';

OrderDetailResponseModel orderDetailResponseModelFromJson(String str) =>
    OrderDetailResponseModel.fromJson(json.decode(str));

String orderDetailResponseModelToJson(OrderDetailResponseModel data) =>
    json.encode(data.toJson());

class OrderDetailResponseModel extends OrderDetailResponse {
  const OrderDetailResponseModel({
    required super.orderSource,
    required super.paymentMethod,
    required super.addressId,
    required super.carrierId,
    required super.typeOrder,
    required List<OrderItemDetailModel>
        super.items, // Modèle des items spécifiques
  });

  factory OrderDetailResponseModel.fromJson(Map<String, dynamic> json) =>
      OrderDetailResponseModel(
        orderSource: json["orderSource"],
        paymentMethod: json["paymentMethod"],
        addressId: json["addressId"],
        carrierId: json["carrierId"],
        typeOrder: json["typeOrder"],
        items: List<OrderItemDetailModel>.from(
            json["items"].map((x) => OrderItemDetailModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "orderSource": orderSource,
        "paymentMethod": paymentMethod,
        "addressId": addressId,
        "carrierId": carrierId,
        "typeOrder": typeOrder,
        "items": List<dynamic>.from(
            (items as List<OrderItemDetailModel>).map((item) => item.toJson())),
      };

  factory OrderDetailResponseModel.fromEntity(OrderDetailResponse entity) =>
      OrderDetailResponseModel(
        orderSource: entity.orderSource,
        paymentMethod: entity.paymentMethod,
        addressId: entity.addressId,
        carrierId: entity.carrierId,
        typeOrder: entity.typeOrder,
        items: entity.items
            .map((item) => OrderItemDetailModel.fromEntity(item))
            .toList(),
      );
}

class OrderItemDetailModel extends OrderItemDetail {
  const OrderItemDetailModel({
    required int productVariantId,
    required int quantity,
  }) : super(
          productVariantId: productVariantId,
          quantity: quantity,
        );

  factory OrderItemDetailModel.fromJson(Map<String, dynamic> json) =>
      OrderItemDetailModel(
        productVariantId: json["productVariantId"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "productVariantId": productVariantId,
        "quantity": quantity,
      };

  factory OrderItemDetailModel.fromEntity(OrderItemDetail entity) =>
      OrderItemDetailModel(
        productVariantId: entity.productVariantId,
        quantity: entity.quantity,
      );
}
