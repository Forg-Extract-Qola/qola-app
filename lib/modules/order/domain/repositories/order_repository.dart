
import 'package:dartz/dartz.dart';
import 'package:qola_app/core/exceptions/failure.dart';
import 'package:qola_app/modules/order/domain/dtos/order_dish.dart';
import 'package:qola_app/modules/order/domain/dtos/order_dto.dart';

abstract class OrderRepository {
  Future<Either<Failure, List<OrderDto>>> getOrders();
  Future<Either<Failure, OrderDto>> getOrderById(int orderId);
  Future<Either<Failure, OrderDto>> saveOrder(OrderDto order);
  Future<Either<Failure, bool>> deleteOrder(int orderId);

  Future<Either<Failure, OrderDishDto>> saveOrderDish(OrderDishDto orderDish);
  Future<Either<Failure, bool>> deleteOrderDish(int orderDishId);
}