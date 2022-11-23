import 'package:dartz/dartz.dart';
import 'package:qola_app/core/exceptions/failure.dart';
import 'package:qola_app/core/usecases/usecase.dart';
import 'package:qola_app/modules/order/domain/repositories/order_repository.dart';

class DoRemoveOrderDish implements UseCase<bool, int> {
  final OrderRepository _orderRepository;

  DoRemoveOrderDish({required OrderRepository orderRepository})
      : _orderRepository = orderRepository;

  @override
  Future<Either<Failure, bool>> call(int orderDishId) async {
    return await _orderRepository.deleteOrderDish(orderDishId);
  }
}