import 'package:dartz/dartz.dart';
import 'package:qola_app/core/exceptions/failure.dart';
import 'package:qola_app/core/usecases/usecase.dart';
import 'package:qola_app/modules/order/domain/dtos/order_dish.dart';
import 'package:qola_app/modules/order/domain/repositories/order_repository.dart';

class DoAddOrderDish implements UseCase<OrderDishDto, OrderDishDto> {
  final OrderRepository _orderRepository;

  DoAddOrderDish({required OrderRepository orderRepository})
      : _orderRepository = orderRepository;

  @override
  Future<Either<Failure, OrderDishDto>> call(OrderDishDto orderDish) async {
    return await _orderRepository.saveOrderDish(orderDish);
  }
}