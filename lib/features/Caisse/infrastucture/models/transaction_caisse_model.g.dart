// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_caisse_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionCaisseModel _$TransactionCaisseModelFromJson(
        Map<String, dynamic> json) =>
    TransactionCaisseModel(
      id: (json['id'] as num).toInt(),
      transactionDate: json['transactionDate'] as String,
      amount: (json['amount'] as num).toDouble(),
      transactionType: json['transactionType'] as String,
    );

Map<String, dynamic> _$TransactionCaisseModelToJson(
        TransactionCaisseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'transactionDate': instance.transactionDate,
      'amount': instance.amount,
      'transactionType': instance.transactionType,
    };
