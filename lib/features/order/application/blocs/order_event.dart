part of 'order_bloc.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();
}

class GetOrders extends OrderEvent {
  final FilterOrderParams params;
  const GetOrders(this.params);

  @override
  List<Object> get props => [params];
}

class ClearLocalOrders extends OrderEvent {
  const ClearLocalOrders();

  @override
  List<Object> get props => [];
}

class AddOrder extends OrderEvent {
  final OrderDetailResponse params;
  const AddOrder(this.params);

  @override
  List<Object> get props => [params];
}
