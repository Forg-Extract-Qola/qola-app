import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:qola_app/core/field/field_required.dart';
import 'package:qola_app/core/utils/messages.dart';
import 'package:qola_app/modules/order/domain/dtos/table_dto.dart';
import 'package:qola_app/modules/order/presentation/bloc/table/table_bloc.dart';
import 'package:qola_app/shared/qola_buttons.dart';
import 'package:qola_app/shared/qola_text_field.dart';

class TableNameReadOnly extends StatelessWidget {

  final TableDto? table;

  const TableNameReadOnly({Key? key, this.table}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GenericFormField(
      value: table?.name,
      hintText: 'Nombre',
      readOnly: true
    );
  }
}


class TableNameField extends StatelessWidget {
  const TableNameField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TableBloc, TableState>(
      buildWhen: (prev, next) => prev.name != next.name,
      builder: (context, state) {
        return GenericFormField(
          value: state.name.value,
          hintText: 'Nombre',
          onChanged: (name) => context.read<TableBloc>().add(TableEventChanged(name)),
          validationText: !state.name.pure && state.name.error == FieldRequiredValidationError.empty ? fieldRequiredFormat : null
        );
      }
    );
  }
}

class TableEnableEditButton extends StatelessWidget {
  const TableEnableEditButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TableBloc, TableState>(
      builder: (context, state) {
        return LargeSolidButton(
          text: 'Editar',
          onPressed: () => context.read<TableBloc>().add(const TableEnableEdit())
        );
      },
    );
  }
}


class TableSubmitButton extends StatelessWidget {
  const TableSubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TableBloc, TableState>(
      builder: (context, state) {
        return LargeSolidButton(
          text: state.table == null ? 'REGISTRAR' : 'MODIFICAR',
          onPressed: state.status == FormzStatus.valid ||
              state.status == FormzStatus.submissionFailure ?
              () => context.read<TableBloc>().add(const TableSubmitted()) : null,
          child: state.status == FormzStatus.submissionInProgress
              ? const CircularProgressIndicator(color: Colors.white)
              : null,
        );
      },
    );
  }
}