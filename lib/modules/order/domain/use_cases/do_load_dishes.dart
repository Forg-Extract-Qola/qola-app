import 'package:dartz/dartz.dart';
import 'package:qola_app/core/exceptions/failure.dart';
import 'package:qola_app/core/usecases/usecase.dart';
import 'package:qola_app/modules/order/domain/dtos/dish_dto.dart';
import 'package:qola_app/modules/order/domain/repositories/dish_repository.dart';

class DoLoadDishes implements UseCase<List<DishDto>, NoParams> {
  final DishRepository _dishRepository;

  DoLoadDishes({required DishRepository dishRepository})
      : _dishRepository = dishRepository;

  @override
  Future<Either<Failure, List<DishDto>>> call(NoParams noParams) async {
    return await _dishRepository.getAllDishes();
  }
}