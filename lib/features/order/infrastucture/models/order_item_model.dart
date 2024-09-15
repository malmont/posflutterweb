import 'package:json_annotation/json_annotation.dart';
import 'package:pos_flutter/features/order/domain/entities/order_item.dart';

part 'order_item_model.g.dart';

@JsonSerializable()
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

  factory OrderItemModel.fromJson(Map<String, dynamic> json) =>
      _$OrderItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderItemModelToJson(this);

  factory OrderItemModel.fromEntity(OrderItem entity) => OrderItemModel(
        id: entity.id,
        quantity: entity.quantity,
        unitPrice: entity.unitPrice,
        totalPrice: entity.totalPrice,
        productId: entity.productId,
        productVariantName: entity.productVariantName,
        productImage: entity.productImage,
      );

  Map<String, dynamic> toJsonBody() => {
        "id": id,
        "quantity": quantity,
        "unitPrice": unitPrice,
        "totalPrice": totalPrice,
        "productId": productId,
        "productVariantName": productVariantName,
        "productImage": productImage,
      };
}
