import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:qola_app/core/field/field_required.dart';
import 'package:qola_app/core/utils/messages.dart';
import 'package:qola_app/modules/order/presentation/bloc/table/table_bloc.dart';
import 'package:qola_app/shared/qola_buttons.dart';
import 'package:qola_app/shared/qola_text_field.dart';

class TableNameField extends StatelessWidget {
  const TableNameField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TableBloc, TableState>(
      buildWhen: (prev, next) => prev.table != next.table,
      builder: (context, state) {
        return GenericFormField(
          value: state.table.value,
          hintText: 'Nombre',
          onChanged: (name) => context.read<TableBloc>().add(TableEventChanged(name)),
          validationText: !state.table.pure && state.table.error == FieldRequiredValidationError.empty ? fieldRequiredFormat : null
        );
      }
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
          text: 'REGISTRAR',
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