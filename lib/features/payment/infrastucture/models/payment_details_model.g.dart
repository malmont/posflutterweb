// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentDetailsModel _$PaymentDetailsModelFromJson(Map<String, dynamic> json) =>
    PaymentDetailsModel(
      id: (json['id'] as num).toInt(),
      amount: (json['amount'] as num).toDouble(),
      paymentDate: DateTime.parse(json['paymentDate'] as String),
      orderReference: json['orderReference'] as String,
      paymentMethod: json['paymentMethod'] as String,
      paymentStatus: json['paymentStatus'] as String,
    );

Map<String, dynamic> _$PaymentDetailsModelToJson(
        PaymentDetailsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'paymentDate': instance.paymentDate.toIso8601String(),
      'orderReference': instance.orderReference,
      'paymentMethod': instance.paymentMethod,
      'paymentStatus': instance.paymentStatus,
    };
