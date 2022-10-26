import 'package:flutter/material.dart';
import 'package:qola_app/modules/order/presentation/screens/employee/employee_add_edit_form.dart';
import 'package:qola_app/shared/qola_pages.dart';
import 'package:qola_app/shared/qola_texts.dart';
import 'package:qola_app/theme/colors.dart';

class EmployeeAddEditScreen extends StatelessWidget {
  const EmployeeAddEditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomBlankWithTitlePage(
      title: 'Trabajadores',
      child: EmployeeAddEditForm(),
    );
  }
}

class EmployeeAddEditForm extends StatelessWidget {
  const EmployeeAddEditForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(
        children: const [
          CustomText('Registro de un nuevo trabajador', color: primaryColor, size: 20.0,),
          SizedBox(height: 40.0),
          EmployeeNameField(),
          EmployeeCodeField(),
          EmployeeSubmitButton()
        ],
      ),
    );
  }
}
