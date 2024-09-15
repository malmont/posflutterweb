// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderItemModel _$OrderItemModelFromJson(Map<String, dynamic> json) =>
    OrderItemModel(
      id: (json['id'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
      unitPrice: json['unitPrice'] as num,
      totalPrice: json['totalPrice'] as num,
      productId: (json['productId'] as num).toInt(),
      productVariantName: json['productVariantName'] as String,
      productImage: json['productImage'] as String,
    );

Map<String, dynamic> _$OrderItemModelToJson(OrderItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
      'unitPrice': instance.unitPrice,
      'totalPrice': instance.totalPrice,
      'productId': instance.productId,
      'productVariantName': instance.productVariantName,
      'productImage': instance.productImage,
    };
