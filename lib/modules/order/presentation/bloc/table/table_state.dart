part of 'table_bloc.dart';

@immutable
class TableState extends Equatable {
  final FormzStatus status;
  final FieldRequired name;
  final String? error;
  final bool editable;
  final TableDto? table;

  const TableState({
    this.status = FormzStatus.pure,
    this.name = const FieldRequired.pure(),
    this.error,
    this.editable = false,
    this.table
  });

  TableState copyWith({
    FormzStatus? status,
    FieldRequired? name,
    String? error,
    bool? editable,
    TableDto? table
  }) {
    return TableState(
      status: status ?? this.status,
      name: name ?? this.name,
      error: error ?? this.error,
      editable: editable ?? this.editable,
      table: table ?? this.table
    );
  }

  @override
  List<Object?> get props => [status, name, error, editable, table];
}
