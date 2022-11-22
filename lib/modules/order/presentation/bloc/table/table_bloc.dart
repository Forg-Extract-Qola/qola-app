import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';
import 'package:qola_app/core/field/field_required.dart';
import 'package:qola_app/modules/order/domain/dtos/table_dto.dart';
import 'package:qola_app/modules/order/domain/use_cases/do_create_table.dart';
import 'package:qola_app/modules/order/domain/use_cases/do_upload_table.dart';

part 'table_event.dart';
part 'table_state.dart';

class TableBloc extends Bloc<TableEvent, TableState> {
  final DoCreateTables _doCreateTable;
  final DoUpdateTables _doUpdateTable;
  TableBloc({
    required DoCreateTables doCreateTable,
    required DoUpdateTables doUpdateTable
  }) : _doCreateTable = doCreateTable,
  _doUpdateTable = doUpdateTable,
        super(const TableState()) {
    on<TableLoaded>(_onTableLoaded);
    on<TableEventChanged>(_onTableEventChanged);
    on<TableEnableEdit>(_onTableEventEnableEdit);
    on<TableSubmitted>(_onTableEventSubmitted);
  }

  void _onTableLoaded(TableLoaded event, Emitter<TableState> emit) {
    if (event.table == null) return;
    final name = FieldRequired.dirty(event.table!.name!);
    emit(state.copyWith(
      name: name,
      table: event.table,
      status: Formz.validate([name]))
    );
    add(const TableEnableEdit());
  }

  void _onTableEventChanged(TableEventChanged event, Emitter<TableState> emit) {
    final name = FieldRequired.dirty(event.name);
    emit(state.copyWith(
      name: name,
      status: Formz.validate([name]))
    );
  }

  void _onTableEventEnableEdit(TableEnableEdit event, Emitter<TableState> emit) async {
    emit(state.copyWith(editable: true));
  }

  void _onTableEventSubmitted(
      TableSubmitted event, Emitter<TableState> emit) async {
    if (!state.status.isValidated) return;

    emit(state.copyWith(status: FormzStatus.submissionInProgress));

    // Create table
    if (state.table == null) {
      (await _doCreateTable(TableDto(name: state.name.value))).fold(
        (l) => emit(state.copyWith(
          status: FormzStatus.submissionFailure,
          error: l.props.first?.toString()
        )),
        (result) => emit(state.copyWith(
          status: FormzStatus.submissionSuccess)
        ));
      return;
    }

    // Update table
    (await _doUpdateTable(TableDto(name: state.name.value, id: state.table!.id))).fold(
      (l) => emit(state.copyWith(
        status: FormzStatus.submissionFailure,
        error: l.props.first?.toString()
      )),
      (result) => emit(state.copyWith(
        status: FormzStatus.submissionSuccess)
      ));
  }
}
