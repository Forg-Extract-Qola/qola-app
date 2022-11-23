import 'package:dartz/dartz.dart';
import 'package:qola_app/core/exceptions/failure.dart';
import 'package:qola_app/modules/order/domain/dtos/dish_dto.dart';

abstract class DishRepository {
  Future<Either<Failure, List<DishDto>>> getAllDishes();
  Future<Either<Failure, List<DishDto>>> getAllDishesByCategoryNameAndRestaurantId(int restaurantId, String category);
  Future<Either<Failure, DishDto>> getDish();
  Future<Either<Failure, DishDto>> saveDish(DishDto dish);
  Future<Either<Failure, DishDto>> updateDish(DishDto dish);
  Future<Either<Failure, DishDto>> deleteDish(int dish);
}
