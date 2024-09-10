import 'package:json_annotation/json_annotation.dart';
import 'size_model.dart';
import 'color_model.dart';
import '../../../domain/entities/product/variant.dart';

part 'variant_model.g.dart';

@JsonSerializable(explicitToJson: true)
class VariantModel extends Variant {
  final ColorModel color;
  final SizeModel size;

  const VariantModel({
    required super.id,
    required this.color,
    required this.size,
    required super.stockQuantity,
  }) : super(
          color: color,
          size: size,
        );

  // Méthode générée pour la désérialisation depuis JSON
  factory VariantModel.fromJson(Map<String, dynamic> json) =>
      _$VariantModelFromJson(json);

  // Méthode générée pour la sérialisation vers JSON
  @override
  Map<String, dynamic> toJson() => _$VariantModelToJson(this);

  // Méthode utilitaire pour convertir une entité Variant en VariantModel
  factory VariantModel.fromEntity(Variant entity) => VariantModel(
        id: entity.id,
        color: ColorModel.fromEntity(entity.color),
        size: SizeModel.fromEntity(entity.size),
        stockQuantity: entity.stockQuantity,
      );
}
