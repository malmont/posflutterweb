// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'color_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ColorModel _$ColorModelFromJson(Map<String, dynamic> json) => ColorModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      codeHexa: json['codeHexa'] as String,
    );

Map<String, dynamic> _$ColorModelToJson(ColorModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'codeHexa': instance.codeHexa,
    };
