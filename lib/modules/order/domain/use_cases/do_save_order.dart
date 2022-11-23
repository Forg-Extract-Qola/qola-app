import 'package:dartz/dartz.dart';
import 'package:qola_app/core/exceptions/failure.dart';
import 'package:qola_app/core/usecases/usecase.dart';
import 'package:qola_app/modules/order/domain/dtos/order_dto.dart';
import 'package:qola_app/modules/order/domain/repositories/order_repository.dart';

class DoSaveOrder implements UseCase<OrderDto, OrderDto> {
  final OrderRepository _orderRepository;

  DoSaveOrder({required OrderRepository orderRepository})
      : _orderRepository = orderRepository;

  @override
  Future<Either<Failure, OrderDto>> call(OrderDto order) async {
    return await _orderRepository.saveOrder(order);
  }
}