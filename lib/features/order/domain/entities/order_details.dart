import 'package:equatable/equatable.dart';

import 'order_item.dart';

class OrderDetails extends Equatable {
  final int id;
  final String reference;
  final num totalAmount;
  final String orderDate;
  final int userId;
  final int shippingAdress;
  final String orderSource;
  final List<OrderItem> orderItems;

  const OrderDetails({
    required this.id,
    required this.reference,
    required this.totalAmount,
    required this.orderDate,
    required this.userId,
    required this.shippingAdress,
    required this.orderSource,
    required this.orderItems,
  });

  @override
  List<Object> get props => [
        id,
        reference,
        totalAmount,
        orderDate,
        userId,
        shippingAdress,
        orderSource,
        orderItems,
      ];
}
