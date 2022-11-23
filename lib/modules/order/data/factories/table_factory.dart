import 'package:qola_app/modules/order/data/models/table_model.dart';
import 'package:qola_app/modules/order/domain/dtos/table_dto.dart';
import 'package:qola_app/modules/order/domain/entities/table_entity.dart';

class TableFactory {
  static TableDto convertToTableDto(TableModel table) {
    return TableDto(
      id: table.id,
      name: table.name,
      restaurantId: table.restaurantId,
      isOccupied: table.isOccupied,
    );
  }

  static List<TableDto> convertToListTableDto(List<TableModel> tables) {
    return List.generate(
        tables.length, (index) => convertToTableDto(tables[index]));
  }

  static TableModel convertToTableModel(TableDto table) {
    return TableModel(
      id: table.id,
      name: table.name,
      restaurantId: table.restaurantId,
      isOccupied: table.isOccupied,
    );
  }

  static TableDto convertFromEntityToDto(TableEntity table) {
    return TableDto(
      id: table.id,
      name: table.name,
      isOccupied: table.isOccupied
    );
  }

  static List<TableEntity> convertToListTableEntity(List<TableModel> tables) {
    return List.generate(
        tables.length, (index) => TableEntity.fromJson(tables[index].toJson()));
  }
}
