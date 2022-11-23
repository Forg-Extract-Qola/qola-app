/*
{
  "name": "string",
  "description": "string",
  "image": "string",
  "category_dish": "string",
  "price": 0
}
*/

import 'package:dartz/dartz.dart';
import 'package:qola_app/core/exceptions/failure.dart';
import 'package:qola_app/modules/auth/data/data_sources/session_local_data_source.dart';
import 'package:qola_app/modules/order/data/data_sources/dish_remote_data_source.dart';
import 'package:qola_app/modules/order/data/factories/dish_factory.dart';
import 'package:qola_app/modules/order/domain/dtos/dish_dto.dart';
import 'package:qola_app/modules/order/domain/repositories/dish_repository.dart';

class DishRepositoryImpl extends DishRepository {
  final DishRemoteDataSource _dishRemoteDataSource;
  final SessionLocalDataSource _sessionLocalDataSource;

  DishRepositoryImpl({required DishRemoteDataSource dishRemoteDataSource,
    required SessionLocalDataSource sessionLocalDataSource})
      : _dishRemoteDataSource = dishRemoteDataSource,
        _sessionLocalDataSource = sessionLocalDataSource;

  @override
  Future<Either<Failure, DishDto>> deleteDish(int dish) {
    // TODO: implement deleteDish
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<DishDto>>> getAllDishes() async {
    try {
      final response = await _dishRemoteDataSource.getDishesByRestaurantId(
          _sessionLocalDataSource.getRestaurant() ?? 0);
      return Right(DishFactory.convertToListDishDto(response));
    } catch (e) {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<DishDto>>> getAllDishesByCategoryNameAndRestaurantId(int restaurantId, String category) async {
    try {
      final response = await _dishRemoteDataSource
          .getAllDishesByCategoryNameAndRestaurantId(category,restaurantId);
      return Right(DishFactory.convertToListDishDto(response));
    } catch (e) {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, DishDto>> getDish() {
    // TODO: implement getDish
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, DishDto>> saveDish(DishDto dish) async {
    try {
      final response = await _dishRemoteDataSource.createDish(
          DishFactory.convertToDishModel(dish),
          _sessionLocalDataSource.getRestaurant() ?? 0);
      return Right(DishFactory.convertToDishDto(response));
    } catch (e) {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, DishDto>> updateDish(DishDto dish) async {
    try {
      final response = await _dishRemoteDataSource.updateDish(
          DishFactory.convertToDishModel(dish));
      return Right(DishFactory.convertToDishDto(response));
    } catch (e) {
      return const Left(ServerFailure(message: 'Error while update dish'));
    }
  }

}

