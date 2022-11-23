import 'package:formz/formz.dart';

enum FieldRequiredDoubleValidationError { empty }
class FieldRequiredDouble extends FormzInput<double, FieldRequiredDoubleValidationError> {
  const FieldRequiredDouble.pure() : super.pure(0.0);
  const FieldRequiredDouble.dirty([double value = 0.0]) : super.dirty(value);
  @override
  FieldRequiredDoubleValidationError? validator(double? value) {
    if (value == null) return null;
    if (value <= 0.0) return FieldRequiredDoubleValidationError.empty;
    return null;
  }
}