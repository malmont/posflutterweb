import 'package:json_annotation/json_annotation.dart';
import 'package:pos_flutter/features/Caisse/domain/entities/transaction_caisse.dart'; // Import de l'entité

part 'transaction_caisse_model.g.dart';

@JsonSerializable()
class TransactionCaisseModel extends TransactionCaisse {
  TransactionCaisseModel({
    required int id,
    required String transactionDate,
    required double amount,
    required String transactionType,
  }) : super(
            id: id,
            transactionDate: transactionDate,
            amount: amount,
            transactionType: transactionType);

  // Factory constructor to convert from entity to model
  factory TransactionCaisseModel.fromEntity(TransactionCaisse entity) =>
      TransactionCaisseModel(
        id: entity.id,
        transactionDate: entity.transactionDate,
        amount: entity.amount,
        transactionType: entity.transactionType,
      );

  factory TransactionCaisseModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionCaisseModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionCaisseModelToJson(this);
}
