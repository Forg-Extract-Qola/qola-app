part of 'table_bloc.dart';

@immutable
abstract class TableEvent extends Equatable {
  const TableEvent();

  @override
  List<Object?> get props => [];
}

class TableEventChanged extends TableEvent {
  final String tableEvent;

  const TableEventChanged(this.tableEvent);

  @override
  List<Object?> get props => [tableEvent];
}

class TableEventSubmitted extends TableEvent {
  const TableEventSubmitted();
}
