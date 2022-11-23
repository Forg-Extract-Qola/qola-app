import 'package:qola_app/modules/order/data/models/order_dish_model.dart';
import 'package:qola_app/modules/order/data/models/order_model.dart';
import 'package:qola_app/modules/order/domain/dtos/order_dish.dart';
import 'package:qola_app/modules/order/domain/dtos/order_dto.dart';

class OrderFactory {
  static OrderDto convertToOrderDto(OrderModel order) {
    return OrderDto(
      id: order.id,
      status: order.status,
      notes: order.notes,
      total: order.total,
      tableId: order.tableId,
      waiterId: order.waiterId
    );
  }

  static OrderDishModel convertToOrderDishModel(OrderDishDto orderDish) {
    return OrderDishModel(
      id: orderDish.id,
      orderId: orderDish.orderId,
      dishId: orderDish.dishId
    );
  }

  static OrderDishDto convertToOrderDishDto(OrderDishModel orderDish) {
    return OrderDishDto(
      id: orderDish.id,
      orderId: orderDish.orderId,
      dishId: orderDish.dishId
    );
  }

  static OrderModel convertToOrderModel(OrderDto order) {
    return OrderModel(
      id: order.id,
      status: order.status,
      notes: order.notes,
      tableId: order.tableId,
      waiterId: order.waiterId
    );
  }

  static List<OrderDishDto> convertToListOrderDishDto(
      List<OrderDishModel> orderDishes) {
    return List.generate(
        orderDishes.length, (index) => convertToOrderDishDto(orderDishes[index]));
  }
}