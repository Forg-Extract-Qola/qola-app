part of 'table_bloc.dart';

@immutable
abstract class TableEvent extends Equatable {
  const TableEvent();

  @override
  List<Object?> get props => [];
}

class TableLoaded extends TableEvent {
  final TableDto? table;

  const TableLoaded(this.table);

  @override
  List<Object?> get props => [table];
}

class TableEventChanged extends TableEvent {
  final String name;

  const TableEventChanged(this.name);

  @override
  List<Object?> get props => [name];
}

class TableSubmitted extends TableEvent {
  const TableSubmitted();
}
