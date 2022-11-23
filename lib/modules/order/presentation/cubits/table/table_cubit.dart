import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:qola_app/core/bloc/bloc_state.dart';
import 'package:qola_app/core/usecases/usecase.dart';
import 'package:qola_app/core/utils/console.dart';
import 'package:qola_app/modules/order/domain/dtos/table_dto.dart';
import 'package:qola_app/modules/order/domain/use_cases/do_available_tables.dart';
import 'package:qola_app/modules/order/domain/use_cases/do_load_tables.dart';
import 'package:qola_app/routes.dart';

part 'table_state.dart';

class TableCubit extends Cubit<TableState> {
  final DoLoadTables _doLoadTables;
  final DoLoadAvailableTables _doLoadAvailableTables;

  TableCubit({
    required DoLoadTables doLoadTables,
    required DoLoadAvailableTables doLoadAvailableTables,
  })  : _doLoadTables = doLoadTables,
        _doLoadAvailableTables = doLoadAvailableTables,
        super(const TableState());

  loadTables() async {
    await _loadTables();
  }

  loadAvailableTables() async {
    await _loadAvailableTables();
  }

  openAddEditTable(BuildContext context, { TableDto? table }) async {
    final result = await Navigator.pushNamed(context, RoutesPath.tableAddEditPath, arguments: table);
    if (result == null || result is! bool || result == false) return;
    await _loadTables();
  }

  _loadTables() async {
    final result = await _doLoadTables(NoParams());
    result.fold(
        (l) => emit(state.copyWith(state: BlocState.error)),
        (tables) =>
            emit(state.copyWith(state: BlocState.success, tables: tables)));
  }

  _loadAvailableTables() async {
    final result = await _doLoadAvailableTables(NoParams());
    result.fold(
        (l) => emit(state.copyWith(state: BlocState.error)),
        (tables) =>
            emit(state.copyWith(state: BlocState.success, tables: tables)));
  }
}
