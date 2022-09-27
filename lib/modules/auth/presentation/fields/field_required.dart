import 'package:formz/formz.dart';

enum FieldRequiredValidationError { empty }

class FieldRequired extends FormzInput<String, FieldRequiredValidationError> {

  const FieldRequired.pure() : super.pure('');
  const FieldRequired.dirty([String value = '']) : super.dirty(value);

  @override
  FieldRequiredValidationError? validator(String? value) {
    if (value == null) return null;
    if (value.isEmpty == true) return FieldRequiredValidationError.empty;
    return null;
  }
}