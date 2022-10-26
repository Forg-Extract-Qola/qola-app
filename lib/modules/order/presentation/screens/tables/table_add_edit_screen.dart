import 'package:flutter/material.dart';
import 'package:qola_app/modules/order/presentation/screens/tables/table_add_edit_form.dart';
import 'package:qola_app/shared/qola_pages.dart';
import 'package:qola_app/shared/qola_texts.dart';
import 'package:qola_app/theme/colors.dart';

class TableAddEditScreen extends StatelessWidget {
  const TableAddEditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomBlankWithTitlePage(
      title: 'Mesas',
      child: TableAddEditForm(),
    );
  }
}

class TableAddEditForm extends StatelessWidget {
  const TableAddEditForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(
        children: const [
          CustomText('Registro de una nueva mesa', color: primaryColor, size: 20.0,),
          SizedBox(height: 40.0),
          TableNameField(),
          TableSubmitButton()
        ],
      ),
    );
  }
}
