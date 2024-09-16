import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:pos_flutter/features/payment/domain/entities/payment_details.dart';

part 'payment_details_model.g.dart';

@JsonSerializable()
class PaymentDetailsModel extends PaymentDetails {
  PaymentDetailsModel({
    required int id,
    required double amount,
    required DateTime paymentDate,
    required String orderReference,
    required String paymentMethod,
    required String paymentStatus,
  }) : super(
          id: id,
          amount: amount,
          paymentDate: paymentDate,
          orderReference: orderReference,
          paymentMethod: paymentMethod,
          paymentStatus: paymentStatus,
        );

  // Factory method pour générer un PaymentDetailsModel à partir d'un JSON
  factory PaymentDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentDetailsModelFromJson(json);

  // Méthode pour convertir un PaymentDetailsModel en JSON
  Map<String, dynamic> toJson() => _$PaymentDetailsModelToJson(this);
}

List<PaymentDetailsModel> paymentDetailsModelListFromLocalJson(String str) =>
    List<PaymentDetailsModel>.from(
        json.decode(str).map((x) => PaymentDetailsModel.fromJson(x)));

String paymentModelListToJson(List<PaymentDetailsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
