part of 'admin_login_bloc.dart';

@immutable
abstract class AdminLoginEvent extends Equatable {
  const AdminLoginEvent();

  @override
  List<Object?> get props => [];
}

class LoginEmailChanged extends AdminLoginEvent {
  final String email;

  const LoginEmailChanged(this.email);

  @override
  List<Object?> get props => [email];
}

class LoginPasswordChanged extends AdminLoginEvent {
  final String password;

  const LoginPasswordChanged(this.password);

  @override
  List<Object?> get props => [password];
}

class LoginSubmitted extends AdminLoginEvent {
  const LoginSubmitted();
}