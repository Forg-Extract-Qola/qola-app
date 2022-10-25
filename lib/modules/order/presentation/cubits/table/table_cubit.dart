import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:qola_app/core/bloc/bloc_state.dart';
import 'package:qola_app/core/usecases/usecase.dart';
import 'package:qola_app/modules/order/domain/dtos/table_dto.dart';
import 'package:qola_app/modules/order/domain/use_cases/do_load_tables.dart';

part 'table_state.dart';

class TableCubit extends Cubit<TableState> {
  final DoLoadTables _doLoadTables;

  TableCubit({required DoLoadTables doLoadTables})
      : _doLoadTables = doLoadTables,
        super(const TableState());

  loadTables() async {
    await _loadTables();
  }

  _loadTables() async {
    final result = await _doLoadTables(NoParams());
    result.fold(
        (l) => emit(state.copyWith(state: BlocState.error)),
        (tables) =>
            emit(state.copyWith(state: BlocState.success, tables: tables)));
  }
}
