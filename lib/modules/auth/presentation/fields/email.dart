import 'package:formz/formz.dart';

enum EmailValidationError { empty, format }

class Email extends FormzInput<String, EmailValidationError> {

  const Email.pure() : super.pure('');
  const Email.dirty([String value = '']) : super.dirty(value);

  @override
  EmailValidationError? validator(String? value) {
    if (value == null) return null;
    if (value.isEmpty == true) return EmailValidationError.empty;
    bool emailFormatValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
    if (!emailFormatValid) return EmailValidationError.format;
    return null;
  }
}