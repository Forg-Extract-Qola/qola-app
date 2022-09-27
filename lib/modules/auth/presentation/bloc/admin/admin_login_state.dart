part of 'admin_login_bloc.dart';

@immutable
class AdminLoginState extends Equatable {

  final FormzStatus status;
  final Email email;
  final FieldRequired password;
  final String? error;

  const AdminLoginState({
    this.status = FormzStatus.pure,
    this.email = const Email.pure(),
    this.password = const FieldRequired.pure(),
    this.error
  });

  AdminLoginState copyWith({
    FormzStatus? status,
    Email? email,
    FieldRequired? password,
    String? error
  }) {
    return AdminLoginState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
      error: error ?? this.error
    );
  }

  @override
  List<Object?> get props => [status, email, password, error];
}
