import 'package:dartz/dartz.dart';
import 'package:qola_app/core/exceptions/failure.dart';
import 'package:qola_app/core/usecases/usecase.dart';
import 'package:qola_app/modules/order/domain/dtos/order_dto.dart';
import 'package:qola_app/modules/order/domain/repositories/order_repository.dart';

class DoLoadOrder implements UseCase<OrderDto, int> {
  final OrderRepository _orderRepository;

  DoLoadOrder({required OrderRepository orderRepository})
      : _orderRepository = orderRepository;

  @override
  Future<Either<Failure, OrderDto>> call(int orderId) async {
    return await _orderRepository.getOrderById(orderId);
  }
}
