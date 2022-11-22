import 'package:dartz/dartz.dart';
import 'package:qola_app/core/exceptions/failure.dart';
import 'package:qola_app/core/usecases/usecase.dart';
import 'package:qola_app/modules/order/domain/dtos/table_dto.dart';
import 'package:qola_app/modules/order/domain/repositories/table_repository.dart';

class DoUpdateTables implements UseCase<TableDto, TableDto> {
  final TableRepository _tableRepository;

  DoUpdateTables({required TableRepository tableRepository})
      : _tableRepository = tableRepository;

  @override
  Future<Either<Failure, TableDto>> call(TableDto table) async {
    return await _tableRepository.updateTable(table, table.id!);
  }
}