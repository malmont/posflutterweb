import 'package:bloc/bloc.dart';

import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:pos_flutter/core/usecases/usecases.dart';
import 'package:pos_flutter/features/order/domain/entities/filter_order_params.dart';
import 'package:pos_flutter/features/order/domain/entities/order_details.dart';
import 'package:pos_flutter/features/order/domain/usecases/clear_local_order_usecase.dart';
import 'package:pos_flutter/features/order/domain/usecases/get_cached_orders_usecase.dart';
import 'package:pos_flutter/features/order/domain/usecases/get_remote_orders_usecase.dart';

part 'order_fetch_state.dart';

@injectable
class OrderFetchCubit extends Cubit<OrderFetchState> {
  final GetRemoteOrdersUseCase _getOrdersUseCase;
  final GetCachedOrdersUseCase _getCachedOrdersUseCase;
  final ClearLocalOrdersUseCase _clearLocalOrdersUseCase;
  OrderFetchCubit(this._getOrdersUseCase, this._getCachedOrdersUseCase,
      this._clearLocalOrdersUseCase)
      : super(const OrderFetchInitial([], FilterOrderParams()));

  void getOrders(FilterOrderParams params) async {
    try {
      emit(OrderFetchLoading(state.orders, state.params));
      final cachedResult = await _getCachedOrdersUseCase(NoParams());
      cachedResult.fold(
        (failure) => (),
        (orders) => emit(OrderFetchSuccess(orders, state.params)),
      );
      final remoteResult = await _getOrdersUseCase(params);
      remoteResult.fold(
        (failure) => emit(OrderFetchFail(state.orders, state.params)),
        (orders) => emit(OrderFetchSuccess(orders, state.params)),
      );
    } catch (e) {
      emit(OrderFetchFail(state.orders, state.params));
    }
  }

  void clearLocalOrders() async {
    try {
      emit(OrderFetchLoading(state.orders, state.params));
      final cachedResult = await _clearLocalOrdersUseCase(NoParams());
      cachedResult.fold(
        (failure) => (),
        (result) => emit(const OrderFetchInitial([], FilterOrderParams())),
      );
    } catch (e) {
      emit(OrderFetchFail(state.orders, state.params));
    }
  }
}
