import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';
import 'package:qola_app/core/field/field_required.dart';
import 'package:qola_app/modules/order/domain/dtos/dish_dto.dart';
import 'package:qola_app/modules/order/domain/dtos/order_dto.dart';
import 'package:qola_app/modules/order/domain/use_cases/do_add_order_dish.dart';
import 'package:qola_app/modules/order/domain/use_cases/do_load_order.dart';
import 'package:qola_app/modules/order/domain/use_cases/do_remove_order_dish.dart';
import 'package:qola_app/modules/order/domain/use_cases/do_save_order.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {

  final DoLoadOrder _doLoadOrder;
  final DoSaveOrder _doSaveOrder;
  final DoAddOrderDish _doAddOrderDish;
  final DoRemoveOrderDish _doRemoveOrderDish;

  OrderBloc({
    required DoLoadOrder doLoadOrder,
    required DoSaveOrder doSaveOrder,
    required DoAddOrderDish doAddOrderDish,
    required DoRemoveOrderDish doRemoveOrderDish
  }) : _doLoadOrder = doLoadOrder,
        _doSaveOrder = doSaveOrder,
        _doAddOrderDish = doAddOrderDish,
        _doRemoveOrderDish = doRemoveOrderDish,
        super(const OrderState()) {
    on<OrderEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
