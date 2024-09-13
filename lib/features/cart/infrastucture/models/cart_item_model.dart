import 'dart:convert';

import 'package:pos_flutter/features/cart/domain/entities/cart_item.dart';
import 'package:pos_flutter/features/products/domain/entities/product/product.dart';
import 'package:pos_flutter/features/products/domain/entities/product/variant.dart';
import 'package:pos_flutter/features/products/infrastucture/models/product/product_model.dart';
import 'package:pos_flutter/features/products/infrastucture/models/product/variant_model.dart';

List<CartItemModel> cartItemModelListFromLocalJson(String str) =>
    List<CartItemModel>.from(
        json.decode(str).map((x) => CartItemModel.fromJson(x)));

List<CartItemModel> cartItemModelListFromRemoteJson(String str) =>
    List<CartItemModel>.from(
        json.decode(str)["data"].map((x) => CartItemModel.fromJson(x)));

List<CartItemModel> cartItemModelFromJson(String str) =>
    List<CartItemModel>.from(
        json.decode(str).map((x) => CartItemModel.fromJson(x)));

String cartItemModelToJson(List<CartItemModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CartItemModel extends CartItem {
  const CartItemModel({
    super.id,
    required ProductModel super.product,
    super.quantity,
    required VariantModel super.variant,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      variant: VariantModel.fromJson(json["variant"]),
      id: json["_id"],
      product: ProductModel.fromJson(json["product"]),
      quantity: json["quantity"] ?? 1,
    );
  }

  Map<String, dynamic> toJson() => {
        "variant": (variant as VariantModel).toJson(),
        "_id": id,
        "product": (product as ProductModel).toJson(),
        "quantity": quantity,
      };

  Map<String, dynamic> toBodyJson() => {
        "variant": (variant as VariantModel).toJson(),
        "_id": id,
        "product": product.id,
        "quantity": quantity,
      };

  factory CartItemModel.fromParent(CartItem cartItem) {
    return CartItemModel(
      id: cartItem.id,
      product: cartItem.product is ProductModel
          ? cartItem.product as ProductModel
          : ProductModel.fromEntity(cartItem.product),
      quantity: cartItem.quantity,
      variant: cartItem.variant is VariantModel
          ? cartItem.variant as VariantModel
          : VariantModel.fromEntity(cartItem.variant),
    );
  }

  @override
  CartItemModel copyWith({
    String? id,
    Product? product,
    int? quantity,
    Variant? variant,
  }) {
    return CartItemModel(
      variant: variant is VariantModel
          ? variant
          : VariantModel.fromEntity(variant ?? this.variant),
      id: id ?? this.id,
      product: product is ProductModel
          ? product
          : ProductModel.fromEntity(product ?? this.product),
      quantity: quantity ?? this.quantity,
    );
  }
}
