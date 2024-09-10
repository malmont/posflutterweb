// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      moreInformations: json['moreInformations'] as String?,
      price: (json['price'] as num).toInt(),
      purchasePrice: (json['purchasePrice'] as num).toInt(),
      coefficientMultiplier: (json['coefficientMultiplier'] as num).toInt(),
      barcode: json['barcode'] as String?,
      isBestseller: json['isBestseller'] as bool?,
      isNewArrival: json['isNewArrival'] as bool?,
      isFeatured: json['isFeatured'] as bool?,
      isSpecialOffer: json['isSpecialOffer'] as bool?,
      image: json['image'] as String,
      quantity: (json['quantity'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      tags: json['tags'] as String?,
      slug: json['slug'] as String,
      style: StyleModel.fromJson(json['style'] as Map<String, dynamic>),
      variants: (json['variants'] as List<dynamic>)
          .map((e) => VariantModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      category: (json['category'] as List<dynamic>)
          .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'moreInformations': instance.moreInformations,
      'price': instance.price,
      'purchasePrice': instance.purchasePrice,
      'coefficientMultiplier': instance.coefficientMultiplier,
      'barcode': instance.barcode,
      'isBestseller': instance.isBestseller,
      'isNewArrival': instance.isNewArrival,
      'isFeatured': instance.isFeatured,
      'isSpecialOffer': instance.isSpecialOffer,
      'image': instance.image,
      'quantity': instance.quantity,
      'createdAt': instance.createdAt.toIso8601String(),
      'tags': instance.tags,
      'slug': instance.slug,
      'style': instance.style.toJson(),
      'variants': instance.variants.map((e) => e.toJson()).toList(),
      'category': instance.category.map((e) => e.toJson()).toList(),
    };
