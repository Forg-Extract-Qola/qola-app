import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:formz/formz.dart';
import 'package:qola_app/modules/auth/domain/dtos/login_dto.dart';
import 'package:qola_app/modules/auth/domain/use_cases/do_admin_login.dart';
import 'package:qola_app/modules/auth/presentation/fields/email.dart';
import 'package:qola_app/modules/auth/presentation/fields/field_required.dart';

part 'admin_login_event.dart';
part 'admin_login_state.dart';

class AdminLoginBloc extends Bloc<AdminLoginEvent, AdminLoginState> {

  final DoAdminLogin _doAdminLogin;

  AdminLoginBloc({ required DoAdminLogin doAdminLogin }) :
    _doAdminLogin = doAdminLogin,
    super(const AdminLoginState()) {
    on<LoginEmailChanged>(_onEmailChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginSubmitted>(_onSubmitted);
  }

  void _onEmailChanged(LoginEmailChanged event, Emitter<AdminLoginState> emit) {
    final email = Email.dirty(event.email);
    emit(state.copyWith(email: email, status: Formz.validate([email, state.password])));
  }

  void _onPasswordChanged(LoginPasswordChanged event, Emitter<AdminLoginState> emit) {
    final password = FieldRequired.dirty(event.password);
    emit(state.copyWith(password: password, status: Formz.validate([password, state.email])));
  }

  void _onSubmitted(LoginSubmitted event, Emitter<AdminLoginState> emit) async {

    if (!state.status.isValidated) return;

    emit(state.copyWith(status: FormzStatus.submissionInProgress));

    final result = await _doAdminLogin(LoginDto(email: state.email.value, password: state.password.value));
    result.fold(
      (l) => emit(state.copyWith(status: FormzStatus.submissionFailure, error: l.props.first?.toString())),
      (result) => emit(state.copyWith(status: FormzStatus.submissionSuccess))
    );
  }
}
