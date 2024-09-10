import 'package:json_annotation/json_annotation.dart';
import '../../../domain/entities/product/size.dart';

part 'size_model.g.dart';

@JsonSerializable()
class SizeModel extends Size {
  const SizeModel({
    required super.id,
    required super.name,
  });

  factory SizeModel.fromJson(Map<String, dynamic> json) =>
      _$SizeModelFromJson(json);

  Map<String, dynamic> toJson() => _$SizeModelToJson(this);

  factory SizeModel.fromEntity(Size entity) => SizeModel(
        id: entity.id,
        name: entity.name,
      );
}
