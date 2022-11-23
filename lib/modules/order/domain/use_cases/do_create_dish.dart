import 'package:dartz/dartz.dart';
import 'package:qola_app/core/exceptions/failure.dart';
import 'package:qola_app/core/usecases/usecase.dart';
import 'package:qola_app/modules/order/domain/dtos/dish_dto.dart';
import 'package:qola_app/modules/order/domain/repositories/dish_repository.dart';

class DoCreateDishes implements UseCase<DishDto, DishDto> {
  final DishRepository _dishRepository;

  DoCreateDishes({required DishRepository dishRepository})
      : _dishRepository = dishRepository;

  @override
  Future<Either<Failure, DishDto>> call(DishDto dish) async {
    return await _dishRepository.saveDish(dish);
  }
}