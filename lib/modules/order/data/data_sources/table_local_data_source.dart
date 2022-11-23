import 'package:qola_app/core/data/box_repository.dart';
import 'package:qola_app/modules/order/domain/entities/table_entity.dart';

abstract class TableLocalDataSource {
  Future<List<TableEntity>> getAllTables();
  Future<TableEntity?> getTable(int tableId);
  Future<bool> saveTables(List<TableEntity> tables);
}

class TableLocalDataSourceImpl implements TableLocalDataSource {

  final BoxRepository<TableEntity> _tableRepository;

  TableLocalDataSourceImpl({
    required BoxRepository<TableEntity> tableRepository
  }) : _tableRepository = tableRepository;


  @override
  Future<List<TableEntity>> getAllTables() async {
    return (await _tableRepository.getAll());
  }

  @override
  Future<TableEntity?> getTable(int tableId) async {
    final result = await _tableRepository.getOne((table) => table.id == tableId);
    return result;
  }

  @override
  Future<bool> saveTables(List<TableEntity> tables) async {
    try {
      final contentByRoom = await _tableRepository.getAll();
      if (contentByRoom.isNotEmpty) {
        await _tableRepository.deleteAll();
      }
      await _tableRepository.saveAll(tables);
      return true;
    }
    catch (_) {
      return false;
    }
  }
}