import 'package:dartz/dartz.dart';
import 'package:qola_app/core/exceptions/failure.dart';
import 'package:qola_app/core/usecases/usecase.dart';
import 'package:qola_app/modules/order/domain/dtos/table_dto.dart';
import 'package:qola_app/modules/order/domain/repositories/table_repository.dart';

class DoLoadTables extends UseCase<List<TableDto>, NoParams> {
  final TableRepository _tableRepository;

  DoLoadTables({required TableRepository tableRepository})
      : _tableRepository = tableRepository;

  @override
  Future<Either<Failure, List<TableDto>>> call(NoParams noParams) async {
    return await _tableRepository.getTables();
  }
}
