import 'dart:convert';

import 'package:qola_app/core/providers/http_provider.dart';
import 'package:qola_app/core/utils/constants.dart';
import 'package:qola_app/modules/auth/data/data_sources/session_local_data_source.dart';
import 'package:qola_app/modules/order/data/models/dish_model.dart';

class DishRemoteDataSource {
  final HttpProvider _httpProvider;
  final SessionLocalDataSource _sessionLocalDataSource;

  DishRemoteDataSource({
    required HttpProvider httpProvider,
    required SessionLocalDataSource sessionLocalDataSource,
  })  : _httpProvider = httpProvider,
        _sessionLocalDataSource = sessionLocalDataSource;

  Future<List<DishModel>> getDishesByRestaurantId(int restaurantId) async {
    final response =
        await _httpProvider.get('$BASE_URL/restaurant/dish/$restaurantId');
    return List<DishModel>.from(response.map((x) => DishModel.fromJson(x)));
  }

  Future<List<DishModel>> getAllDishesByCategoryNameAndRestaurantId(
      String categoryName, int restaurantId) async {
    final response = await _httpProvider.get(
        '$BASE_URL/restaurant/dish/$restaurantId/category/$categoryName');
    return List<DishModel>.from(response.map((x) => DishModel.fromJson(x)));
  }

  Future<DishModel> createDish(DishModel dishModel, int restaurantId) async {
    final response = await _httpProvider.post(
      '$BASE_URL/dish?restaurantId=$restaurantId',
      jsonEncode(dishModel.toSaveResource()),
      token: _sessionLocalDataSource.getToken());
    return DishModel.fromJson(response);
  }

  Future<DishModel> updateDish(DishModel dishModel) async {
    final response = await _httpProvider.put(
      '$BASE_URL/dish/${dishModel.id}',
      jsonEncode(dishModel.toSaveResource()),
      token: _sessionLocalDataSource.getToken());
    return DishModel.fromJson(response);
  }
}