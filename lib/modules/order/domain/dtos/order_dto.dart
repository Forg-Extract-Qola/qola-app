import 'package:qola_app/modules/order/domain/dtos/employee_dto.dart';
import 'package:qola_app/modules/order/domain/dtos/order_dish.dart';
import 'package:qola_app/modules/order/domain/dtos/table_dto.dart';

class OrderDto {
  int? id;
  String? status;
  String? notes;
  int? total;
  int? tableId;
  int? waiterId;
  TableDto? table;
  EmployeeDto? employee;
  List<OrderDishDto>? orderDish;

  OrderDto({
    this.id,
    this.status,
    this.notes,
    this.total,
    this.tableId,
    this.waiterId,
    this.table,
    this.employee,
    this.orderDish
  });
}