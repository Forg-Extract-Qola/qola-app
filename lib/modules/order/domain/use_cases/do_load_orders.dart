import 'package:dartz/dartz.dart';
import 'package:qola_app/core/exceptions/failure.dart';
import 'package:qola_app/core/usecases/usecase.dart';
import 'package:qola_app/modules/order/domain/dtos/order_dto.dart';
import 'package:qola_app/modules/order/domain/repositories/order_repository.dart';

class DoLoadOrders implements UseCase<List<OrderDto>, NoParams> {
  final OrderRepository _orderRepository;

  DoLoadOrders({required OrderRepository orderRepository})
      : _orderRepository = orderRepository;

  @override
  Future<Either<Failure, List<OrderDto>>> call(NoParams noParams) async {
    return await _orderRepository.getOrders();
  }
}
