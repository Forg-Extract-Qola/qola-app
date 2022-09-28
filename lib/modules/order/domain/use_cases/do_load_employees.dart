import 'package:dartz/dartz.dart';
import 'package:qola_app/core/exceptions/failure.dart';
import 'package:qola_app/core/usecases/usecase.dart';
import 'package:qola_app/modules/order/domain/dtos/employee_dto.dart';
import 'package:qola_app/modules/order/domain/repositories/employee_repository.dart';

class DoLoadEmployees implements UseCase<List<EmployeeDto>, NoParams> {

  final EmployeeRepository _employeeRepository;

  DoLoadEmployees({required  EmployeeRepository employeeRepository }) :
        _employeeRepository = employeeRepository;

  @override
  Future<Either<Failure, List<EmployeeDto>>> call(NoParams noParams) async {
    return await _employeeRepository.getEmployees();
  }
}