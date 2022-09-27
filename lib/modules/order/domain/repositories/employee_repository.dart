
import 'package:dartz/dartz.dart';
import 'package:qola_app/core/exceptions/failure.dart';
import 'package:qola_app/modules/order/domain/dtos/employee_dto.dart';

abstract class EmployeeRepository {
  Future<Either<Failure, List<EmployeeDto>>> getEmployees();
  Future<Either<Failure, EmployeeDto>> getEmployee();
  Future<Either<Failure, EmployeeDto>> saveEmployee(EmployeeDto employee);
  Future<Either<Failure, EmployeeDto>> updateEmployee(EmployeeDto employee, int employeeId);
  Future<Either<Failure, EmployeeDto>> deleteEmployee(int employee);
}