import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import '../../../domain/entities/product/color.dart';

part 'color_model.g.dart';

@JsonSerializable()
class ColorModel extends Color {
  const ColorModel({
    required super.id,
    required super.name,
    required super.codeHexa,
  });

  factory ColorModel.fromJson(Map<String, dynamic> json) =>
      _$ColorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ColorModelToJson(this);

  factory ColorModel.fromEntity(Color entity) => ColorModel(
        id: entity.id,
        name: entity.name,
        codeHexa: entity.codeHexa,
      );
}

List<ColorModel> colorModelListFromJson(String str) =>
    List<ColorModel>.from(json
        .decode(str)
        .map((x) => ColorModel.fromJson(x as Map<String, dynamic>)));
String colorModelListToJson(List<ColorModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
