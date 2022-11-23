import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';
import 'package:qola_app/core/field/double_field_required.dart';
import 'package:qola_app/core/field/field_required.dart';
import 'package:qola_app/modules/order/domain/dtos/dish_dto.dart';
import 'package:qola_app/modules/order/domain/use_cases/do_create_dish.dart';
import 'package:qola_app/modules/order/domain/use_cases/do_upload_dish.dart';

part 'dish_event.dart';
part 'dish_state.dart';

class DishBloc extends Bloc<DishEvent, DishState> {
  final DoCreateDishes _doCreateDish;
  final DoUpdateDishes _doUpdateDish;
  DishBloc({
    required DoCreateDishes doCreateDish,
    required DoUpdateDishes doUpdateDish
  }) : _doCreateDish = doCreateDish,
  _doUpdateDish = doUpdateDish,
        super(const DishState()) {
    on<DishLoaded>(_onDishLoaded);
    on<DishNameChanged>(_onDishNameChanged);
    on<DishDescriptionChanged>(_onDishDescriptionChanged);
    on<DishImageChanged>(_onDishImageChanged);
    on<DishCategoryDishChanged>(_onDishCategoryDishChanged);
    on<DishPriceChanged>(_onDishPriceChanged);
    on<DishEnableEdit>(_onDishEventEnableEdit);
    on<DishSubmitted>(_onDishEventSubmitted);
  }

  void _onDishLoaded(DishLoaded event, Emitter<DishState> emit) {
    if (event.dish == null) {
      add(const DishEnableEdit());
      return;
    }
    final name = FieldRequired.dirty(event.dish!.name!);
    final description = FieldRequired.dirty(event.dish!.description!);
    final image = FieldRequired.dirty(event.dish!.image!);
    final categoryDish = FieldRequired.dirty(event.dish!.categoryDish!);
    final price = FieldRequiredDouble.dirty(event.dish!.price!);
    emit(state.copyWith(
      name: name,
      description: description,
      image: image,
      categoryDish: categoryDish,
      price: price,
      dish: event.dish,
      status: Formz.validate([name, description, image, categoryDish, price]))
    );
    add(const DishEnableEdit());
  }

  void _onDishNameChanged (DishNameChanged event, Emitter<DishState> emit) {
    final name = FieldRequired.dirty(event.name);
    emit(state.copyWith(
      name: name,
      status: Formz.validate([name]))
    );
  }

  void _onDishDescriptionChanged (DishDescriptionChanged event, Emitter<DishState> emit) {
    final description = FieldRequired.dirty(event.description);
    emit(state.copyWith(
      description: description,
      status: Formz.validate([description]))
    );
  }

  void _onDishImageChanged (DishImageChanged event, Emitter<DishState> emit) {
    final image = FieldRequired.dirty(event.image);
    emit(state.copyWith(
      image: image,
      status: Formz.validate([image]))
    );
  }

  void _onDishCategoryDishChanged (DishCategoryDishChanged event, Emitter<DishState> emit) {
    final categoryDish = FieldRequired.dirty(event.categoryDish);
    emit(state.copyWith(
      categoryDish: categoryDish,
      status: Formz.validate([categoryDish]))
    );
  }

  void _onDishPriceChanged (DishPriceChanged event, Emitter<DishState> emit) {
    final price = FieldRequiredDouble.dirty(double.parse(event.price));
    emit(state.copyWith(
      price: price,
      status: Formz.validate([price]))
    );
  }

  void _onDishEventEnableEdit(DishEnableEdit event, Emitter<DishState> emit) async {
    emit(state.copyWith(editable: true));
  }

  void _onDishEventSubmitted(
      DishSubmitted event, Emitter<DishState> emit) async {
    if (!state.status.isValidated) return;

    emit(state.copyWith(status: FormzStatus.submissionInProgress));

    // Create dish
    if (state.dish == null) {
      (await _doCreateDish(DishDto(
        name: state.name.value,
        description: state.description.value,
        image: state.image.value,
        categoryDish: state.categoryDish.value,
        price: state.price.value
      ))).fold(
        (l) => emit(state.copyWith(
          status: FormzStatus.submissionFailure,
          error: l.props.first?.toString()
        )),
        (result) => emit(state.copyWith(
          status: FormzStatus.submissionSuccess)
        ));
      return;
    }

    // Update dish
    (await _doUpdateDish(DishDto(
      name: state.name.value,
      description: state.description.value,
      image: state.image.value,
      categoryDish: state.categoryDish.value,
      price: state.price.value,
      id: state.dish!.id
    ))).fold(
      (l) => emit(state.copyWith(
        status: FormzStatus.submissionFailure,
        error: l.props.first?.toString()
      )),
      (result) => emit(state.copyWith(
        status: FormzStatus.submissionSuccess)
      ));
  }

}
