part of 'dish_bloc.dart';

@immutable
abstract class DishEvent extends Equatable {
  const DishEvent();

  @override
  List<Object?> get props => [];
}

class DishLoaded extends DishEvent {
  final DishDto? dish;

  const DishLoaded(this.dish);

  @override
  List<Object?> get props => [dish];
}

class DishNameChanged extends DishEvent {
  final String name;

  const DishNameChanged(this.name);

  @override
  List<Object?> get props => [name];
}

class DishDescriptionChanged extends DishEvent {
  final String description;

  const DishDescriptionChanged(this.description);

  @override
  List<Object?> get props => [description];
}

class DishImageChanged extends DishEvent {
  final String image;

  const DishImageChanged(this.image);

  @override
  List<Object?> get props => [image];
}

class DishCategoryDishChanged extends DishEvent {
  final String categoryDish;

  const DishCategoryDishChanged(this.categoryDish);

  @override
  List<Object?> get props => [categoryDish];
}

class DishPriceChanged extends DishEvent {
  final String price;

  const DishPriceChanged(this.price);

  @override
  List<Object?> get props => [price];
}

class DishEnableEdit extends DishEvent {
  const DishEnableEdit();
}

class DishSubmitted extends DishEvent {
  const DishSubmitted();
}


