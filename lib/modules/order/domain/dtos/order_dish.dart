import 'package:qola_app/modules/order/domain/dtos/dish_dto.dart';

class OrderDishDto {
  int? id;
  int? orderId;
  int? dishId;
  DishDto? dish;

  OrderDishDto({
    this.id,
    this.orderId,
    this.dishId,
    this.dish
  });
}