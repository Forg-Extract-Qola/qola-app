import 'package:qola_app/modules/order/data/data_sources/table_remote_data_source.dart';
import 'package:qola_app/modules/order/data/factories/table_factory.dart';
import 'package:qola_app/modules/order/domain/dtos/table_dto.dart';
import 'package:qola_app/core/exceptions/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:qola_app/modules/order/domain/repositories/table_repository.dart';

class TableRepositoryImpl extends TableRepository {
  final TableRemoteDataSource _tableRemoteDataSource;

  TableRepositoryImpl({required TableRemoteDataSource tableRemoteDataSource})
      : _tableRemoteDataSource = tableRemoteDataSource;
  @override
  Future<Either<Failure, TableDto>> deleteTable(int table) {
    // TODO: implement deleteTable
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, TableDto>> getTable() {
    // TODO: implement getTable
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<TableDto>>> getTables() async {
    try {
      const int restaurant = 34;
      final response =
          await _tableRemoteDataSource.getTablesByRestaurantId(restaurant);
      return Right(TableFactory.convertToListTableDto(response));
    } catch (e) {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, TableDto>> saveTable(
      TableDto table, int restaurantId) async {
    try {
      final response = await _tableRemoteDataSource.createTable(
          TableFactory.convertToTableModel(table), restaurantId);
      return Right(TableFactory.convertToTableDto(response));
    } catch (e) {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, TableDto>> updateTable(
      TableDto table, int tableId) async {
    try {
      final response = await _tableRemoteDataSource.updateTable(
          TableFactory.convertToTableModel(table), tableId);
      return Right(TableFactory.convertToTableDto(response));
    } catch (e) {
      return const Left(ServerFailure());
    }
  }
}
