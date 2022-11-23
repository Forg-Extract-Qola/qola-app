import 'package:dartz/dartz.dart';
import 'package:qola_app/core/exceptions/failure.dart';
import 'package:qola_app/modules/order/data/data_sources/employee_local_data_source.dart';
import 'package:qola_app/modules/order/data/data_sources/employee_remote_data_source.dart';
import 'package:qola_app/modules/order/data/factories/employee_factory.dart';
import 'package:qola_app/modules/order/domain/dtos/employee_dto.dart';
import 'package:qola_app/modules/order/domain/repositories/employee_repository.dart';

class EmployeeRepositoryImpl implements EmployeeRepository {

  final EmployeeRemoteDataSource _employeeRemoteDataSource;
  final EmployeeLocalDataSource _employeeLocalDataSource;

  EmployeeRepositoryImpl({
    required EmployeeRemoteDataSource employeeRemoteDataSource,
    required EmployeeLocalDataSource employeeLocalDataSource,
  }) : _employeeRemoteDataSource = employeeRemoteDataSource,
      _employeeLocalDataSource = employeeLocalDataSource;


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
  Future<Either<Failure, List<EmployeeDto>>> getEmployees() async {
    try {
      const int restaurant = 34;
      final response = await _employeeRemoteDataSource.getEmployeesByRestaurant(restaurant);

      // save employees to database
      // _employeeLocalDataSource.saveEmployees(EmployeeFactory.convertToListEmployeeEntity(response));

      return Right(EmployeeFactory.convertToListEmployeeDto(response));
    }
    catch (e) {
      return const Left(ServerFailure());
    }
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