import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:qola_app/core/bloc/bloc_state.dart';
import 'package:qola_app/core/usecases/usecase.dart';
import 'package:qola_app/modules/order/domain/dtos/dish_dto.dart';
import 'package:qola_app/modules/order/domain/use_cases/do_load_dishes.dart';
import 'package:qola_app/modules/order/presentation/bloc/dish/dish_bloc.dart';
import 'package:qola_app/routes.dart';

part 'dish_state.dart';

class DishCubit extends Cubit<DishState> {
  final DoLoadDishes _doLoadDishes;
  DishCubit({required DoLoadDishes doLoadDishes})
      : _doLoadDishes = doLoadDishes,
        super(const DishState());

  loadDishes() async {
    await _loadDishes();
  }

  openAddEditDish(BuildContext context, { DishDto? dish }) async {
    final result = await Navigator.pushNamed(context, RoutesPath.dishAddEditPath, arguments: dish);
    if (result == null || result is! bool || result == false) return;
    await _loadDishes();
  }

  _loadDishes() async {
    final result = await _doLoadDishes(NoParams());
    result.fold(
        (l) => emit(state.copyWith(state: BlocState.error)),
        (dishes) =>
            emit(state.copyWith(state: BlocState.success, categories: dishes)));
  }



}
