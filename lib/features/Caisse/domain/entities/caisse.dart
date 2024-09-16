import 'transaction_caisse.dart';

class Caisse {
  final int id;
  final double amountTotal;
  final String createdAt;
  final bool isOpen;
  final List<TransactionCaisse> transactionCaisses;

  Caisse({
    required this.id,
    required this.amountTotal,
    required this.createdAt,
    required this.isOpen,
    required this.transactionCaisses,
  });
}
