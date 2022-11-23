import 'package:qola_app/core/data/box_repository.dart';
import 'package:qola_app/modules/order/domain/entities/employee_entity.dart';

abstract class EmployeeLocalDataSource {
  Future<List<EmployeeEntity>> getAllEmployees();
  Future<EmployeeEntity?> getEmployee(int employeeId);
  Future<bool> saveEmployees(List<EmployeeEntity> employees);
}

class EmployeeLocalDataSourceImpl implements EmployeeLocalDataSource {

  final BoxRepository<EmployeeEntity> _employeeRepository;

  EmployeeLocalDataSourceImpl({
    required BoxRepository<EmployeeEntity> employeeRepository
  }) : _employeeRepository = employeeRepository;


  @override
  Future<List<EmployeeEntity>> getAllEmployees() async {
    return (await _employeeRepository.getAll());
  }

  @override
  Future<EmployeeEntity?> getEmployee(int employeeId) async {
    final result = await _employeeRepository.getOne((employee) => employee.id == employeeId);
    return result;
  }

  @override
  Future<bool> saveEmployees(List<EmployeeEntity> employees) async {
    try {
      final contentByRoom = await _employeeRepository.getAll();
      if (contentByRoom.isNotEmpty) {
        await _employeeRepository.deleteAll();
      }
      await _employeeRepository.saveAll(employees);
      return true;
    }
    catch (_) {
      return false;
    }
  }
}