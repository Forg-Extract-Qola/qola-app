import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:qola_app/core/bloc/bloc_state.dart';
import 'package:qola_app/core/usecases/usecase.dart';
import 'package:qola_app/modules/order/domain/dtos/order_dto.dart';
import 'package:qola_app/modules/order/domain/use_cases/do_load_orders.dart';
import 'package:qola_app/modules/order/presentation/screens/main/pages/order/order_dish_detail.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final DoLoadOrders _doLoadOrders;

  OrderCubit({
    required DoLoadOrders doLoadOrders
  }) : _doLoadOrders = doLoadOrders,
        super(const OrderState());

  loadOrders() async {
    await _loadOrders();
  }

  openCreateOrder(BuildContext context, { OrderDto? order }) async {
    final result = await showDialog(context: context, builder: (_) => const OrderDishDetail());
    if (result == null || result is! bool || result == false) return;
    await _loadOrders();
  }

  _loadOrders() async {
    final result = await _doLoadOrders(NoParams());
    result.fold(
      (l) => emit(state.copyWith(state: BlocState.error)),
      (orders) => emit(state.copyWith(state: BlocState.success, orders: orders))
    );
  }
}
