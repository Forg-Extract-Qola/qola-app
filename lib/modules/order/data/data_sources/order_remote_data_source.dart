import 'dart:convert';

import 'package:qola_app/core/providers/http_provider.dart';
import 'package:qola_app/core/utils/constants.dart';
import 'package:qola_app/modules/auth/data/data_sources/session_local_data_source.dart';
import 'package:qola_app/modules/order/data/models/order_dish_model.dart';
import 'package:qola_app/modules/order/data/models/order_model.dart';

abstract class OrderRemoteDataSource {
  Future<List<OrderModel>> getOrders();
  Future<OrderModel> getOrderById(int orderId);
  Future<OrderModel> saveOrder(OrderModel order, int restaurantId);
  Future<OrderModel> updateOrder(OrderModel order);

  Future<List<OrderDishModel>> getOrderDishesByOrder(int orderId);
  Future<OrderDishModel> saveOrderDish(OrderDishModel orderDish);
  Future<bool> deleteOrderDish(int orderDishId);
}

class OrderRemoteDataSourceImpl implements OrderRemoteDataSource {

  final HttpProvider _httpProvider;
  final SessionLocalDataSource _sessionLocalDataSource;

  OrderRemoteDataSourceImpl({
    required HttpProvider httpProvider,
    required SessionLocalDataSource sessionLocalDataSource
  }) :
    _httpProvider = httpProvider,
    _sessionLocalDataSource = sessionLocalDataSource;

  @override
  Future<List<OrderModel>> getOrders() async {
    final response = await _httpProvider.get('$BASE_URL/order');
    return List<OrderModel>.from(response.map((x) => OrderModel.fromJson(x)));
  }

  @override
  Future<OrderModel> getOrderById(int orderId) async {
    final response = await _httpProvider.get('$BASE_URL/order/$orderId');
    return OrderModel.fromJson(response);
  }

  @override
  Future<OrderModel> saveOrder(OrderModel order, int restaurantId) async {
    final response = await _httpProvider.post(
        '$BASE_URL/order?'
            'restaurantId=$restaurantId&'
            'waiterId=${order.waiterId}&'
            'tableId=${order.tableId}',
        jsonEncode(order.toJson()),
        token: _sessionLocalDataSource.getToken());
    return OrderModel.fromJson(response);
  }

  @override
  Future<OrderModel> updateOrder(OrderModel order) async {
    final response = await _httpProvider.put(
        '$BASE_URL/order/${order.id}',
        jsonEncode(order.toJson()),
        token: _sessionLocalDataSource.getToken());
    return OrderModel.fromJson(response);
  }

  @override
  Future<List<OrderDishModel>> getOrderDishesByOrder(int orderId) async {
    final response = await _httpProvider.get('$BASE_URL/orderdishes/order/$orderId');
    return List<OrderDishModel>.from(response.map((x) => OrderDishModel.fromJson(x)));
  }


  @override
  Future<OrderDishModel> saveOrderDish(OrderDishModel orderDish) async {
    final response = await _httpProvider.post(
    '$BASE_URL/dish?'
      'orderId=${orderDish.orderId}&'
      'dishId=${orderDish.dishId}', '',
    token: _sessionLocalDataSource.getToken());
    return OrderDishModel.fromJson(response);
  }

  @override
  Future<bool> deleteOrderDish(int orderDishId) async {
    final response = await _httpProvider.delete('$BASE_URL/orderdishes/$orderDishId');
    return true;
  }
}