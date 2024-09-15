import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pos_flutter/core/error/failures.dart';
import 'package:pos_flutter/core/usecases/usecases.dart';
import 'package:pos_flutter/features/order/domain/entities/filter_order_params.dart';
import 'package:pos_flutter/features/order/domain/entities/order_detail_response.dart';
import 'package:pos_flutter/features/order/domain/entities/order_details.dart';
import 'package:pos_flutter/features/order/domain/usecases/add_order_usecase.dart';
import 'package:pos_flutter/features/order/domain/usecases/clear_local_order_usecase.dart';
import 'package:pos_flutter/features/order/domain/usecases/get_cached_orders_usecase.dart';
import 'package:pos_flutter/features/order/domain/usecases/get_remote_orders_usecase.dart';

part 'order_state.dart';
part 'order_event.dart';

@injectable
class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final GetRemoteOrdersUseCase _getOrdersUseCase;
  final AddOrderUseCase _addOrderUseCase;
  final GetCachedOrdersUseCase _getCachedOrdersUseCase;
  final ClearLocalOrdersUseCase _clearLocalOrdersUseCase;

  OrderBloc(this._getOrdersUseCase, this._getCachedOrdersUseCase,
      this._clearLocalOrdersUseCase, this._addOrderUseCase)
      : super(const OrderFetcInitial(orders: [], params: FilterOrderParams())) {
    on<GetOrders>(_onGetOrders);
    on<ClearLocalOrders>(_onClearLocalOrders);
    on<AddOrder>(_onAddOrder);
  }

  void _onGetOrders(GetOrders event, Emitter<OrderState> emit) async {
    try {
      emit(OrderFetchLoading(orders: state.orders, params: event.params));
      final cachedResult = await _getCachedOrdersUseCase(NoParams());
      cachedResult.fold(
        (failure) => (),
        (orders) => emit(
            const OrderFetchSuccess(orders: [], params: FilterOrderParams())),
      );
      final remoteResult = await _getOrdersUseCase(event.params);
      remoteResult.fold(
        (failure) => emit(OrderFetchFail(
            orders: state.orders, params: event.params, failure: failure)),
        (orders) =>
            emit(OrderFetchSuccess(orders: orders, params: event.params)),
      );
    } catch (e, stackTrace) {
      print('Erreur: $e, stack: $stackTrace');
      emit(OrderFetchFail(
          orders: state.orders,
          params: state.params,
          failure: ServerFailure()));
    }
  }

  void _onClearLocalOrders(
      ClearLocalOrders event, Emitter<OrderState> emit) async {
    try {
      emit(OrderFetchLoading(orders: state.orders, params: state.params));
      final cachedResult = await _clearLocalOrdersUseCase(NoParams());
      cachedResult.fold(
        (failure) => (),
        (result) => emit(
            const OrderFetcInitial(orders: [], params: FilterOrderParams())),
      );
    } catch (e, stackTrace) {
      print('Erreur: $e, stack: $stackTrace');
      emit(OrderFetchFail(
          orders: state.orders,
          params: state.params,
          failure: ServerFailure()));
    }
  }

  void _onAddOrder(AddOrder event, Emitter<OrderState> emit) async {
    try {
      emit(OrderFetchLoading(orders: state.orders, params: state.params));
      final result = await _addOrderUseCase(event.params);
      result.fold(
        (failure) => emit(OrderFetchFail(
            orders: state.orders, params: state.params, failure: failure)),
        (order) => emit(OrderAddSuccess(
            orders: state.orders, params: state.params, isSuccess: order)),
      );
    } catch (e, stackTrace) {
      print('Erreur: $e, stack: $stackTrace');
      emit(OrderFetchFail(
          orders: state.orders,
          params: state.params,
          failure: ServerFailure()));
    }
  }
}
