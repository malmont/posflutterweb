part of 'order_fetch_cubit.dart';

@immutable
abstract class OrderFetchState {
  final List<OrderDetails> orders;
  final FilterOrderParams params;
  const OrderFetchState(this.orders, this.params);
}

class OrderFetchInitial extends OrderFetchState {
  const OrderFetchInitial(super.orders, super.params);
}

class OrderFetchLoading extends OrderFetchState {
  const OrderFetchLoading(super.orders, super.params);
}

class OrderFetchSuccess extends OrderFetchState {
  const OrderFetchSuccess(super.orders, super.params);
}

class OrderFetchFail extends OrderFetchState {
  const OrderFetchFail(super.orders, super.params);
}
