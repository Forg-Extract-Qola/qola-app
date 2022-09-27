import 'package:dartz/dartz.dart';
import 'package:qola_app/core/exceptions/failure.dart';
import 'package:qola_app/modules/order/domain/dtos/employee_dto.dart';
import 'package:qola_app/modules/order/domain/repositories/employee_repository.dart';

class EmployeeRepositoryImpl implements EmployeeRepository {


  @override
  Future<Either<Failure, EmployeeDto>> deleteEmployee(int employee) {
    // TODO: implement deleteEmployee
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, EmployeeDto>> getEmployee() {
    // TODO: implement getEmployee
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<EmployeeDto>>> getEmployees() {
    // TODO: implement getEmployees
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, EmployeeDto>> saveEmployee(EmployeeDto employee) {
    // TODO: implement saveEmployee
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, EmployeeDto>> updateEmployee(EmployeeDto employee, int employeeId) {
    // TODO: implement updateEmployee
    throw UnimplementedError();
  }
}