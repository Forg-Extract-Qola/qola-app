import 'package:flutter/material.dart';
import 'package:qola_app/shared/qola_buttons.dart';
import 'package:qola_app/shared/qola_text_field.dart';

class EmployeeNameField extends StatelessWidget {
  const EmployeeNameField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GenericFormField(
      hintText: 'Nombre',
    );
  }
}

class EmployeeCodeField extends StatelessWidget {
  const EmployeeCodeField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GenericFormField(
      hintText: 'Código',
    );
  }
}

class EmployeeSubmitButton extends StatelessWidget {
  const EmployeeSubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LargeSolidButton(
      text: 'REGISTRAR',
      onPressed:  () {}
    );
  }
}
