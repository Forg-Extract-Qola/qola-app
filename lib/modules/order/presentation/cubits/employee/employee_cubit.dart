import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:qola_app/core/bloc/bloc_state.dart';
import 'package:qola_app/core/usecases/usecase.dart';
import 'package:qola_app/modules/order/domain/dtos/employee_dto.dart';
import 'package:qola_app/modules/order/domain/use_cases/do_load_employees.dart';

part 'employee_state.dart';

class EmployeeCubit extends Cubit<EmployeeState> {
  final DoLoadEmployees _doLoadEmployees;

  EmployeeCubit({required DoLoadEmployees doLoadEmployees})
      : _doLoadEmployees = doLoadEmployees,
        super(const EmployeeState());

  loadEmployees() async {
    await _loadEmployees();
  }

  _loadEmployees() async {
    final result = await _doLoadEmployees(NoParams());
    result.fold(
        (l) => emit(state.copyWith(state: BlocState.error)),
        (employees) => emit(
            state.copyWith(state: BlocState.success, employees: employees)));
  }
}
