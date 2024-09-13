import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:pos_flutter/features/order/domain/entities/order_detail_response.dart';
import 'package:pos_flutter/features/order/domain/usecases/add_order_usecase.dart';

part 'order_add_state.dart';

@injectable
class OrderAddCubit extends Cubit<OrderAddState> {
  final AddOrderUseCase _addOrderUseCase;
  OrderAddCubit(this._addOrderUseCase) : super(OrderAddInitial());

  void addOrder(OrderDetailResponse params) async {
    try {
      emit(OrderAddLoading());
      final result = await _addOrderUseCase(params);
      result.fold(
        (failure) => emit(OrderAddFail()),
        (order) => emit(OrderAddSuccess(order)),
      );
    } catch (e) {
      emit(OrderAddFail());
    }
  }
}
