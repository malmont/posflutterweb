import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:pos_flutter/features/Caisse/domain/entities/caisse.dart';
import 'transaction_caisse_model.dart';

part 'caisse_model.g.dart';

@JsonSerializable()
class CaisseModel extends Caisse {
  @override
  final List<TransactionCaisseModel> transactionCaisses;

  CaisseModel({
    required int id,
    required double amountTotal,
    required String createdAt,
    required bool isOpen,
    required this.transactionCaisses,
  }) : super(
            id: id,
            amountTotal: amountTotal,
            createdAt: createdAt,
            isOpen: isOpen,
            transactionCaisses: transactionCaisses);

  factory CaisseModel.fromEntity(Caisse entity) => CaisseModel(
        id: entity.id,
        amountTotal: entity.amountTotal,
        createdAt: entity.createdAt,
        isOpen: entity.isOpen,
        transactionCaisses: entity.transactionCaisses
            .map(
                (transaction) => TransactionCaisseModel.fromEntity(transaction))
            .toList(),
      );

  factory CaisseModel.fromJson(Map<String, dynamic> json) =>
      _$CaisseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CaisseModelToJson(this);
}

List<CaisseModel> caisseModelListFromLocalJson(String str) =>
    List<CaisseModel>.from(
        json.decode(str).map((x) => CaisseModel.fromJson(x)));

String caisseModelListToJson(List<CaisseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
