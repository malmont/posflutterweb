part of 'order_bloc.dart';

abstract class OrderState extends Equatable {
  final List<OrderDetails> orders;
  final FilterOrderParams params;
  const OrderState({
    required this.orders,
    required this.params,
  });
  @override
  List<Object> get props => [orders, params];
}

class OrderFetcInitial extends OrderState {
  const OrderFetcInitial({
    required super.orders,
    required super.params,
  });
}

class OrderFetchLoading extends OrderState {
  const OrderFetchLoading({
    required super.orders,
    required super.params,
  });
}

class OrderFetchSuccess extends OrderState {
  const OrderFetchSuccess({
    required super.orders,
    required super.params,
  });
}

class OrderAddLoading extends OrderState {
  const OrderAddLoading({
    required super.orders,
    required super.params,
  });
}

class OrderAddSuccess extends OrderState {
  final bool isSuccess;
  const OrderAddSuccess({
    required this.isSuccess,
    required super.orders,
    required super.params,
  });

  @override
  List<Object> get props => [isSuccess, orders, params];
}

class OrderAddFail extends OrderState {
  const OrderAddFail({
    required super.orders,
    required super.params,
  });
}

class OrderFetchFail extends OrderState {
  final Failure failure;
  const OrderFetchFail({
    required super.orders,
    required super.params,
    required this.failure,
  });
  @override
  List<Object> get props => [failure];
}
