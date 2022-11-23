import 'package:qola_app/modules/order/data/models/dish_model.dart';
import 'package:qola_app/modules/order/domain/dtos/dish_dto.dart';

class DishFactory {

  static DishDto convertToDishDto(DishModel dish) {
    return DishDto(
        id: dish.id,
        name: dish.name,
        description: dish.description,
        image: dish.image,
        categoryDish: dish.categoryDish,
        price: dish.price);
  }

  static List<DishDto> convertToListDishDto(List<DishModel> dishes) {
    return List.generate(dishes.length, (index) => convertToDishDto(dishes[index]));
  }

  static DishModel convertToDishModel(DishDto dish) {
    return DishModel(
        id: dish.id,
        name: dish.name,
        description: dish.description,
        image: dish.image,
        categoryDish: dish.categoryDish,
        price: dish.price);
  }
}