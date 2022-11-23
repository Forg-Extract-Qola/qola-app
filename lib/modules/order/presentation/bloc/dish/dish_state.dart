part of 'dish_bloc.dart';

@immutable
class DishState extends Equatable {
  final FormzStatus status;
  final FieldRequired name;
  final FieldRequired description;
  final FieldRequired image;
  final FieldRequired categoryDish;
  final FieldRequiredDouble price;
  final String? error;
  final bool editable;
  final DishDto? dish;

  const DishState({
    this.status = FormzStatus.pure,
    this.name = const FieldRequired.pure(),
    this.description = const FieldRequired.pure(),
    this.image = const FieldRequired.pure(),
    this.categoryDish = const FieldRequired.pure(),
    this.price = const FieldRequiredDouble.pure(),
    this.error,
    this.editable = false,
    this.dish
  });

  DishState copyWith({
    FormzStatus? status,
    FieldRequired? name,
    FieldRequired? description,
    FieldRequired? image,
    FieldRequired? categoryDish,
    FieldRequiredDouble? price,
    String? error,
    bool? editable,
    DishDto? dish
  }) {
    return DishState(
      status: status ?? this.status,
      name: name ?? this.name,
      description: description ?? this.description,
      image: image ?? this.image,
      categoryDish: categoryDish ?? this.categoryDish,
      price: price ?? this.price,
      error: error ?? this.error,
      editable: editable ?? this.editable,
      dish: dish ?? this.dish
    );
  }

  @override
  List<Object?> get props => [status, name, description, image, categoryDish, price, error, editable, dish];
}