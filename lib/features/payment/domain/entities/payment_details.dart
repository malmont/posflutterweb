class PaymentDetails {
  final int id;
  final double amount;
  final DateTime paymentDate;
  final String orderReference;
  final String paymentMethod;
  final String paymentStatus;

  PaymentDetails({
    required this.id,
    required this.amount,
    required this.paymentDate,
    required this.orderReference,
    required this.paymentMethod,
    required this.paymentStatus,
  });
}
