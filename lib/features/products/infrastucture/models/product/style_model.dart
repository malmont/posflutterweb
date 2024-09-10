import 'package:json_annotation/json_annotation.dart';
import '../../../domain/entities/product/style.dart';

part 'style_model.g.dart';

@JsonSerializable()
class StyleModel extends Style {
  const StyleModel({
    required int id,
    required String name,
  }) : super(
          id: id,
          name: name,
        );

  // Méthode générée pour la désérialisation depuis JSON
  factory StyleModel.fromJson(Map<String, dynamic> json) =>
      _$StyleModelFromJson(json);

  // Méthode générée pour la sérialisation vers JSON
  @override
  Map<String, dynamic> toJson() => _$StyleModelToJson(this);

  // Méthode utilitaire pour convertir une entité Style en StyleModel
  factory StyleModel.fromEntity(Style entity) => StyleModel(
        id: entity.id,
        name: entity.name,
      );
}
