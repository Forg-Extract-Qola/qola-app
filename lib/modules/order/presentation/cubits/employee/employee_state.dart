part of 'employee_cubit.dart';

@immutable
class EmployeeState extends Equatable {

  final BlocState state;
  final List<EmployeeDto> employees;

  const EmployeeState({
    this.state = BlocState.loading,
    this.employees = const []
  });

  EmployeeState copyWith({
    BlocState? state,
    List<EmployeeDto>? employees
  }) {
    return EmployeeState(
      state: state ?? this.state,
      employees: employees ?? this.employees
    );
  }

  @override
  List<Object?> get props => [state, employees];
}