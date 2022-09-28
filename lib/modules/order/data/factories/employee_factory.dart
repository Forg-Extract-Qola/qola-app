
import 'package:qola_app/modules/order/data/models/employee_model.dart';
import 'package:qola_app/modules/order/domain/dtos/employee_dto.dart';

class EmployeeFactory {

  static EmployeeDto convertToEmployeeDto(EmployeeModel employee) {
    return EmployeeDto(
      id: employee.id,
      code: employee.uid,
      name: employee.fullName,
      charge: employee.charge
    );
  }

  static List<EmployeeDto> convertToListEmployeeDto(List<EmployeeModel> employees) {
    return List.generate(employees.length, (index) => convertToEmployeeDto(employees[index]));
  }
}