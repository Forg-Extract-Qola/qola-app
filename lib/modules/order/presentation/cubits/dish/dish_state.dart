part of 'dish_cubit.dart';

@immutable
class DishState extends Equatable {
  final BlocState state;
  final List<DishDto> categories;

  const DishState({
    this.state = BlocState.loading,
    this.categories = const [],
  });

  DishState copyWith({
    BlocState? state,
    List<DishDto>? categories,
  }) {
    return DishState(
      state: state ?? this.state,
      categories: categories ?? this.categories,
    );
  }

  @override
  List<Object?> get props => [state, categories];

}
