import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';
import 'package:qola_app/core/field/field_required.dart';
import 'package:qola_app/core/usecases/usecase.dart';
import 'package:qola_app/modules/order/domain/dtos/dish_dto.dart';
import 'package:qola_app/modules/order/domain/dtos/order_dto.dart';
import 'package:qola_app/modules/order/domain/use_cases/do_add_order_dish.dart';
import 'package:qola_app/modules/order/domain/use_cases/do_load_dishes.dart';
import 'package:qola_app/modules/order/domain/use_cases/do_load_order.dart';
import 'package:qola_app/modules/order/domain/use_cases/do_remove_order_dish.dart';
import 'package:qola_app/modules/order/domain/use_cases/do_save_order.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {

  final DoLoadOrder _doLoadOrder;
  final DoSaveOrder _doSaveOrder;
  final DoLoadDishes _doLoadDishes;
  final DoAddOrderDish _doAddOrderDish;
  final DoRemoveOrderDish _doRemoveOrderDish;

  OrderBloc({
    required DoLoadOrder doLoadOrder,
    required DoSaveOrder doSaveOrder,
    required DoLoadDishes doLoadDishes,
    required DoAddOrderDish doAddOrderDish,
    required DoRemoveOrderDish doRemoveOrderDish
  }) : _doLoadOrder = doLoadOrder,
        _doSaveOrder = doSaveOrder,
        _doLoadDishes = doLoadDishes,
        _doAddOrderDish = doAddOrderDish,
        _doRemoveOrderDish = doRemoveOrderDish,
        super(const OrderState()) {
    on<OrderLoaded>(_onOrderLoaded);
    on<OrderEnableEdit>(_onOrderEventEnableEdit);
    on<OrderNoteEventChanged>(_onOrderNoteEventChanged);
    on<OrderAddOrRemoveDishEventChanged>(_onOrderAddOrRemoveDishEventChanged);
    on<OrderSubmitted>(_onOrderEventSubmitted);
  }

  void _onOrderLoaded(OrderLoaded event, Emitter<OrderState> emit) async {
    // Load dishes
    (await _doLoadDishes(NoParams())).fold(
      (l) => null,
      (dishes) async {

        if (event.order != null) {
          (await _doLoadOrder(event.order!.id!)).fold(
            (l) => null,
            (order) {
              final dishesSelected = order.orderDishes?.map((e) => e.dishId!).toList();
              final notes = FieldRequired.dirty(event.order!.notes!);
              emit(state.copyWith(
                order: order,
                dishesSelected: dishesSelected,
                notes: notes,
                status: Formz.validate([notes]),
                dishes: dishes
              ));
            }
          );
        }
        else {
          emit(state.copyWith(dishes: dishes));
        }
        add(const OrderEnableEdit());
      }
    );
  }

  void _onOrderNoteEventChanged(OrderNoteEventChanged event, Emitter<OrderState> emit) async {
    final notes = FieldRequired.dirty(event.note);
    emit(state.copyWith(
      notes: notes,
      status: Formz.validate([notes]))
    );
  }

  void _onOrderEventEnableEdit(OrderEnableEdit event, Emitter<OrderState> emit) async {
    emit(state.copyWith(editable: true));
  }

  void _onOrderAddOrRemoveDishEventChanged(
    OrderAddOrRemoveDishEventChanged event,
    Emitter<OrderState> emit) async {
    var dishesSelected = List.generate(state.dishesSelected.length, (index) => state.dishesSelected[index]);
    if (dishesSelected.contains(event.dish)) {
      emit(state.copyWith(
        dishesSelected: dishesSelected..remove(event.dish)
      ));

      return;
    }
    emit(state.copyWith(
        dishesSelected: dishesSelected..add(event.dish)
    ));

    emit(state.copyWith(editable: true));
  }

  void _onOrderEventSubmitted(
      OrderSubmitted event, Emitter<OrderState> emit) async {
    if (!state.status.isValidated) return;

    (await _doSaveOrder(OrderDto(notes: state.notes.value))).fold(
      (l) => null,
      (order) {
        final dishesSelected = state.dishesSelected;
      }
    );
  }
}
