import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'package:pos_flutter/features/products/domain/entities/categoty/category.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel extends Category {
  const CategoryModel({
    required super.id,
    required super.name,
    required super.description,
    required super.image,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);

  factory CategoryModel.fromEntity(Category entity) => CategoryModel(
        id: entity.id,
        name: entity.name,
        description: entity.description,
        image: entity.image,
      );
}

List<CategoryModel> categoryModelListFromRemoteJson(String str) =>
    List<CategoryModel>.from(json
        .decode(str)
        .map((x) => CategoryModel.fromJson(x as Map<String, dynamic>)));

List<CategoryModel> categoryModelListFromLocalJson(String str) =>
    List<CategoryModel>.from(json
        .decode(str)
        .map((x) => CategoryModel.fromJson(x as Map<String, dynamic>)));

String categoryModelListToJson(List<CategoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
