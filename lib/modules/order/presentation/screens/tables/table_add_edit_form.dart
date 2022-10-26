import 'package:flutter/material.dart';
import 'package:qola_app/shared/qola_buttons.dart';
import 'package:qola_app/shared/qola_text_field.dart';

class TableNameField extends StatelessWidget {
  const TableNameField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GenericFormField(
      hintText: 'Nombre',
    );
  }
}

class TableSubmitButton extends StatelessWidget {
  const TableSubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LargeSolidButton(
        text: 'REGISTRAR',
        onPressed:  () {}
    );
  }
}