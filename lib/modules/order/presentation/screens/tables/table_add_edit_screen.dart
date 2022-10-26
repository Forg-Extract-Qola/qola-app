import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:qola_app/core/base/injection_container.dart';
import 'package:qola_app/modules/order/domain/dtos/table_dto.dart';
import 'package:qola_app/modules/order/presentation/bloc/table/table_bloc.dart';
import 'package:qola_app/modules/order/presentation/screens/tables/table_add_edit_form.dart';
import 'package:qola_app/shared/qola_pages.dart';
import 'package:qola_app/shared/qola_texts.dart';
import 'package:qola_app/theme/colors.dart';

class TableAddEditScreen extends StatelessWidget {
  const TableAddEditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final table = ModalRoute.of(context)?.settings.arguments as TableDto?;

    return CustomBlankWithTitlePage(
      title: 'Mesas',
      child: BlocProvider<TableBloc>(
        create: (context) => sl<TableBloc>()..add(TableLoaded(table)),
        child: const TableAddEditForm(),
      ),
    );
  }
}

class TableAddEditForm extends StatelessWidget {
  const TableAddEditForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: BlocListener<TableBloc, TableState>(
          listener: resolveResponse,
          child: Column(
              children: const [
                CustomText(
                  'Registro de una nueva mesa', color: primaryColor,
                  size: 20.0,),
                SizedBox(height: 40.0),
                TableNameField(),
                TableSubmitButton()
              ]
          ),
        )
    );
  }

  void resolveResponse(BuildContext context, TableState state) {
    if (state.status == FormzStatus.submissionSuccess) {
      Navigator.pop(context, true);
    }
    if (state.status == FormzStatus.submissionFailure) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(state.error ?? ''),
      ));
    }
  }
}
