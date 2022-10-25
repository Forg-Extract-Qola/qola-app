import 'package:dartz/dartz.dart';
import 'package:qola_app/core/exceptions/failure.dart';
import 'package:qola_app/modules/order/domain/dtos/table_dto.dart';

abstract class TableRepository {
  Future<Either<Failure, List<TableDto>>> getTables();
  Future<Either<Failure, TableDto>> getTable();
  Future<Either<Failure, TableDto>> saveTable(TableDto table, int restaurantId);
  Future<Either<Failure, TableDto>> updateTable(TableDto table, int tableId);
  Future<Either<Failure, TableDto>> deleteTable(int table);
}
