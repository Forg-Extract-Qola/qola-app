part of 'order_bloc.dart';

@immutable
abstract class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object?> get props => [];
}

class OrderLoaded extends OrderEvent {
  final OrderDto? order;

  const OrderLoaded(this.order);

  @override
  List<Object?> get props => [order];
}

class OrderNoteEventChanged extends OrderEvent {
  final String note;

  const OrderNoteEventChanged(this.note);

  @override
  List<Object?> get props => [note];
}

class OrderAddDishEventChanged extends OrderEvent {
  final String dish;

  const OrderAddDishEventChanged(this.dish);

  @override
  List<Object?> get props => [dish];
}

class OrderRemoveDishEventChanged extends OrderEvent {
  final String dish;

  const OrderRemoveDishEventChanged(this.dish);

  @override
  List<Object?> get props => [dish];
}

class OrderEnableEdit extends OrderEvent {
  const OrderEnableEdit();
}

class OrderSubmitted extends OrderEvent {
  const OrderSubmitted();
}