import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';
import 'package:qola_app/core/field/field_required.dart';
import 'package:qola_app/modules/order/domain/dtos/table_dto.dart';
import 'package:qola_app/modules/order/domain/use_cases/do_create_table.dart';
import 'package:qola_app/modules/order/domain/use_cases/do_load_tables.dart';

part 'table_event.dart';
part 'table_state.dart';

class TableBloc extends Bloc<TableEvent, TableState> {
  final DoCreateTables _doCreateTables;
  TableBloc({required DoCreateTables doCreateTables})
      : _doCreateTables = doCreateTables,
        super(const TableState()) {
    on<TableLoaded>(_onTableLoaded);
    on<TableEventChanged>(_onTableEventChanged);
    on<TableSubmitted>(_onTableEventSubmitted);
  }

  void _onTableLoaded(TableLoaded event, Emitter<TableState> emit) {
    if (event.table == null) return;
    final tableEvent = FieldRequired.dirty(event.table!.name!);
    emit(state.copyWith(
        table: tableEvent, status: Formz.validate([tableEvent])));
  }

  void _onTableEventChanged(TableEventChanged event, Emitter<TableState> emit) {
    final tableEvent = FieldRequired.dirty(event.name);
    emit(state.copyWith(
        table: tableEvent, status: Formz.validate([tableEvent])));
  }

  void _onTableEventSubmitted(
      TableSubmitted event, Emitter<TableState> emit) async {
    if (!state.status.isValidated) return;

    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final result = await _doCreateTables(TableDto(name: state.table.value));
    result.fold(
        (l) => emit(state.copyWith(
            status: FormzStatus.submissionFailure,
            error: l.props.first?.toString())),
        (result) =>
            emit(state.copyWith(status: FormzStatus.submissionSuccess)));
  }
}
