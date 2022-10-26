part of 'table_bloc.dart';

@immutable
class TableState extends Equatable {
  final FormzStatus status;
  final FieldRequired table;
  final String? error;

  const TableState({
    this.status = FormzStatus.pure,
    this.table = const FieldRequired.pure(),
    this.error,
  });

  TableState copyWith({
    FormzStatus? status,
    FieldRequired? table,
    String? error,
  }) {
    return TableState(
      status: status ?? this.status,
      table: table ?? this.table,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [status, table, error];
}
