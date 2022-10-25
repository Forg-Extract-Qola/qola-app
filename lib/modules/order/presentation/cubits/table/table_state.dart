part of 'table_cubit.dart';

@immutable
class TableState extends Equatable {
  final BlocState state;
  final List<TableDto> tables;

  const TableState({
    this.state = BlocState.loading,
    this.tables = const [],
  });

  TableState copyWith({
    BlocState? state,
    List<TableDto>? tables,
  }) {
    return TableState(
      state: state ?? this.state,
      tables: tables ?? this.tables,
    );
  }

  @override
  List<Object?> get props => [state, tables];
}
