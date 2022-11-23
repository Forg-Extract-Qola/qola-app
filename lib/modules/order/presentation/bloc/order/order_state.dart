part of 'order_bloc.dart';

@immutable
class OrderState extends Equatable {
  final FormzStatus status;
  final FieldRequired notes;
  final List<int> dishesSelected;
  final String? error;
  final bool editable;
  final List<DishDto> dishes;
  final OrderDto? order;

  const OrderState({
    this.status = FormzStatus.pure,
    this.notes = const FieldRequired.pure(),
    this.dishesSelected = const [],
    this.error,
    this.editable = false,
    this.dishes = const [],
    this.order
  });

  OrderState copyWith({
    FormzStatus? status,
    FieldRequired? notes,
    List<int>? dishesSelected,
    String? error,
    bool? editable,
    List<DishDto>? dishes,
    OrderDto? order
  }) {
    return OrderState(
      status: status ?? this.status,
      notes: notes ?? this.notes,
      dishesSelected: dishesSelected ?? this.dishesSelected,
      error: error ?? this.error,
      editable: editable ?? this.editable,
      dishes: dishes ?? this.dishes,
      order: order ?? this.order
    );
  }

  @override
  List<Object?> get props => [status, notes, dishesSelected, error, editable, dishes, order];
}
