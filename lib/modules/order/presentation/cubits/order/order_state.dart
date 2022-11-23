part of 'order_cubit.dart';

@immutable
class OrderState extends Equatable {

  final BlocState state;
  final List<OrderDto> orders;

  const OrderState({
    this.state = BlocState.loading,
    this.orders = const []
  });

  OrderState copyWith({
    BlocState? state,
    List<OrderDto>? orders
  }) {
    return OrderState(
      state: state ?? this.state,
        orders: orders ?? this.orders
    );
  }

  @override
  List<Object?> get props => [state, orders];
}