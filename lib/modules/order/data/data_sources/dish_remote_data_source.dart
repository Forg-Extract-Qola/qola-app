import 'dart:convert';

import 'package:qola_app/core/providers/http_provider.dart';
import 'package:qola_app/core/utils/constants.dart';
import 'package:qola_app/modules/auth/data/data_sources/session_local_data_source.dart';
import 'package:qola_app/modules/order/data/models/dish_model.dart';

abstract class DishRemoteDataSource {
  Future<List<DishModel>> getDishes();
  Future<List<DishModel>> getDishesByRestaurantId(int restaurantId);
  Future<List<DishModel>> getAllDishesByCategoryNameAndRestaurantId(String categoryName, int restaurantId);
  Future<DishModel> getDishById(int dishId);
  Future<DishModel> saveDish(DishModel dish, int restaurantId);
  Future<DishModel> updateDish(DishModel dish);
  Future<bool> deleteDish(int dishId);
}

class DishRemoteDataSourceImpl implements DishRemoteDataSource {

  final HttpProvider _httpProvider;
  final SessionLocalDataSource _sessionLocalDataSource;

  DishRemoteDataSourceImpl({
    required HttpProvider httpProvider,
    required SessionLocalDataSource sessionLocalDataSource
  }) :
    _httpProvider = httpProvider,
    _sessionLocalDataSource = sessionLocalDataSource;

  @override
  Future<bool> deleteDish(int dishId) async {
    final response = await _httpProvider.delete('$BASE_URL/dish/$dishId');
    return true;
  }

  @override
  Future<DishModel> getDishById(int dishId) async {
    final response = await _httpProvider.get('$BASE_URL/dish/$dishId');
    return DishModel.fromJson(response);
  }

  @override
  Future<List<DishModel>> getDishes() async {
    final response = await _httpProvider.get('$BASE_URL/dish');
    return List<DishModel>.from(response.map((x) => DishModel.fromJson(x)));
  }

  @override
  Future<DishModel> saveDish(DishModel dish, int restaurantId) async {
    final response = await _httpProvider.post(
      '$BASE_URL/dish?restaurantId=$restaurantId',
      jsonEncode(dish.toJson()),
      token: _sessionLocalDataSource.getToken());
    return DishModel.fromJson(response);
  }

  @override
  Future<DishModel> updateDish(DishModel dish) async {
    final response = await _httpProvider.put(
      '$BASE_URL/table/${dish.id}',
      jsonEncode(dish.toJson()),
      token: _sessionLocalDataSource.getToken());
    return DishModel.fromJson(response);
  }

  @override
  Future<List<DishModel>> getAllDishesByCategoryNameAndRestaurantId(String categoryName, int restaurantId) async {
    final response = await _httpProvider.get(
        '$BASE_URL/restaurant/dish/$restaurantId/category/$categoryName');
    return List<DishModel>.from(response.map((x) => DishModel.fromJson(x)));
  }

  @override
  Future<List<DishModel>> getDishesByRestaurantId(int restaurantId) async {
    final response = await _httpProvider.get('$BASE_URL/restaurant/dish/$restaurantId');
    return List<DishModel>.from(response.map((x) => DishModel.fromJson(x)));
  }

}