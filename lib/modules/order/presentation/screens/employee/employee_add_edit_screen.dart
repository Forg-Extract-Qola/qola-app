import 'package:flutter/material.dart';
import 'package:qola_app/shared/qola_pages.dart';

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
    return Container();
  }
}
