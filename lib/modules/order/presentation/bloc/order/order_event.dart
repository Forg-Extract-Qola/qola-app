part of 'order_bloc.dart';

@immutable
abstract class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object?> get props => [];
}

class OrderLoaded extends OrderEvent {
  final OrderDto? order;
  final int? tableId;

  const OrderLoaded(this.order, { this.tableId } );

  @override
  List<Object?> get props => [order, tableId];
}

class OrderNoteEventChanged extends OrderEvent {
  final String note;

  const OrderNoteEventChanged(this.note);

  @override
  List<Object?> get props => [note];
}

class OrderAddOrRemoveDishEventChanged extends OrderEvent {
  final int dish;

  const OrderAddOrRemoveDishEventChanged(this.dish);

  @override
  List<Object?> get props => [dish];
}

class OrderEnableEdit extends OrderEvent {
  const OrderEnableEdit();
}

class OrderSubmitted extends OrderEvent {
  const OrderSubmitted();
}