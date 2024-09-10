import 'package:json_annotation/json_annotation.dart';
import 'package:pos_flutter/features/products/infrastucture/models/product/style_model.dart';
import 'package:pos_flutter/features/products/infrastucture/models/product/variant_model.dart';
import '../../../domain/entities/product/product.dart';
import '../category/category_model.dart';

part 'product_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductModel extends Product {
  const ProductModel({
    required super.id,
    required super.name,
    required super.description,
    super.moreInformations,
    required super.price,
    required super.purchasePrice,
    required super.coefficientMultiplier,
    super.barcode,
    required super.isBestseller,
    required super.isNewArrival,
    required super.isFeatured,
    required super.isSpecialOffer,
    required super.image,
    required super.quantity,
    required super.createdAt,
    super.tags,
    required super.slug,
    required StyleModel super.style,
    required List<VariantModel> super.variants,
    required List<CategoryModel> super.category,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

  factory ProductModel.fromEntity(Product entity) => ProductModel(
        id: entity.id,
        name: entity.name,
        description: entity.description,
        moreInformations: entity.moreInformations,
        price: entity.price,
        purchasePrice: entity.purchasePrice,
        coefficientMultiplier: entity.coefficientMultiplier,
        barcode: entity.barcode,
        isBestseller: entity.isBestseller ?? false,
        isNewArrival: entity.isNewArrival ?? false,
        isFeatured: entity.isFeatured ?? false,
        isSpecialOffer: entity.isSpecialOffer ?? false,
        image: entity.image,
        quantity: entity.quantity,
        createdAt: entity.createdAt,
        tags: entity.tags,
        slug: entity.slug,
        style: StyleModel.fromEntity(entity.style),
        variants: entity.variants
            .map((variant) => VariantModel.fromEntity(variant))
            .toList(),
        category: entity.category
            .map((category) => CategoryModel.fromEntity(category))
            .toList(),
      );
}
