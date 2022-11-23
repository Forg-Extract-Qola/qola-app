import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';
import 'package:qola_app/core/field/field_required.dart';
import 'package:qola_app/modules/order/domain/dtos/dish_dto.dart';

part 'dish_event.dart';
part 'dish_state.dart';

class DishBloc extends Bloc<DishEvent, DishState> {
  DishBloc() : super(DishInitial()) {
    on<DishEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
