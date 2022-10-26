import 'dart:convert';

import 'package:qola_app/core/providers/http_provider.dart';
import 'package:qola_app/core/utils/constants.dart';
import 'package:qola_app/modules/order/data/models/table_model.dart';
import 'package:qola_app/modules/auth/data/data_sources/session_local_data_source.dart';

abstract class TableRemoteDataSource {
  Future<List<TableModel>> getTablesByRestaurantId(int restaurantId);
  Future<TableModel> createTable(TableModel tableModel, int restaurantId);
  Future<TableModel> updateTable(TableModel tableModel, int restaurantId);
  //Future<void> deleteTable(int tableId, int restaurantId);
}

class TableRemoteDataSourceImpl implements TableRemoteDataSource {
  final HttpProvider _httpProvider;
  final SessionLocalDataSource _sessionLocalDataSource;

  TableRemoteDataSourceImpl({
    required HttpProvider httpProvider,
    required SessionLocalDataSource sessionLocalDataSource,
  })  : _httpProvider = httpProvider,
        _sessionLocalDataSource = sessionLocalDataSource;

  @override
  Future<TableModel> createTable(
      TableModel tableModel, int restaurantId) async {
    final response = await _httpProvider.post(
      '$BASE_URL/table?restaurantId=$restaurantId',
      jsonEncode(tableModel.toSaveResource()),
      token: _sessionLocalDataSource.getToken());
    return TableModel.fromJson(response);
  }

  @override
  Future<List<TableModel>> getTablesByRestaurantId(int restaurantId) async {
    final response =
        await _httpProvider.get('$BASE_URL/restaurant/table/$restaurantId');
    return List<TableModel>.from(response.map((x) => TableModel.fromJson(x)));
  }

  @override
  Future<TableModel> updateTable(
      TableModel tableModel, int restaurantId) async {
    final response = await _httpProvider.put(
      '$BASE_URL/table?restaurantId=$restaurantId',
      jsonEncode(tableModel.toSaveResource()),
      token: _sessionLocalDataSource.getToken());
    return TableModel.fromJson(response);
  }
}
