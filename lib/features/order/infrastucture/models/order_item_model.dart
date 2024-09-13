import 'package:pos_flutter/features/order/domain/entities/order_item.dart';

class OrderItemModel extends OrderItem {
  const OrderItemModel({
    required int id,
    required int quantity,
    required num unitPrice,
    required num totalPrice,
    required int productId,
    required String productVariantName,
    required String productImage,
  }) : super(
          id: id,
          quantity: quantity,
          unitPrice: unitPrice,
          totalPrice: totalPrice,
          productId: productId,
          productVariantName: productVariantName,
          productImage: productImage,
        );

  factory OrderItemModel.fromJson(Map<String, dynamic> json) => OrderItemModel(
        id: json["id"],
        quantity: json["quantity"],
        unitPrice: json["unitPrice"],
        totalPrice: json["totalPrice"],
        productId: json["productId"],
        productVariantName: json["productVariantName"],
        productImage: json["productImage"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "quantity": quantity,
        "unitPrice": unitPrice,
        "totalPrice": totalPrice,
        "productId": productId,
        "productVariantName": productVariantName,
        "productImage": productImage,
      };

  Map<String, dynamic> toJsonBody() => {
        "id": id,
        "quantity": quantity,
        "unitPrice": unitPrice,
        "totalPrice": totalPrice,
        "productId": productId,
        "productVariantName": productVariantName,
        "productImage": productImage,
      };

  factory OrderItemModel.fromEntity(OrderItem entity) => OrderItemModel(
        id: entity.id,
        quantity: entity.quantity,
        unitPrice: entity.unitPrice,
        totalPrice: entity.totalPrice,
        productId: entity.productId,
        productVariantName: entity.productVariantName,
        productImage: entity.productImage,
      );
}
