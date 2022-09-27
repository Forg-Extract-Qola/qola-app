import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:qola_app/core/utils/messages.dart';
import 'package:qola_app/modules/auth/presentation/bloc/admin/admin_login_bloc.dart';
import 'package:qola_app/modules/auth/presentation/fields/email.dart';
import 'package:qola_app/modules/auth/presentation/fields/field_required.dart';
import 'package:qola_app/routes.dart';
import 'package:qola_app/shared/qola_buttons.dart';
import 'package:qola_app/shared/qola_text_field.dart';
import 'package:qola_app/shared/qola_texts.dart';

class SignInAdminEmail extends StatelessWidget {
  const SignInAdminEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminLoginBloc, AdminLoginState>(
      buildWhen: (prev, next) => prev.email != next.email,
      builder: (context, state) {
        return GenericIconFormField(
          value: state.email.value,
          hintText: 'Email',
          icon: Icons.mail,
          onChanged: (email) => context.read<AdminLoginBloc>().add(LoginEmailChanged(email)),
          validationText: state.email.pure || state.email.error == null ? null :
            state.email.error == EmailValidationError.empty ? fieldRequiredFormat :
            state.email.error == EmailValidationError.format ? fieldInvalidEmail : null
        );
      },
    );
  }
}

class SignInAdminPassword extends StatelessWidget {
  const SignInAdminPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminLoginBloc, AdminLoginState>(
      buildWhen: (prev, next) => prev.password != next.password,
      builder: (context, state) {
        return GenericIconFormField(
          value: state.password.value,
          hintText: 'Password',
          obscureText: true,
          icon: Icons.key,
          onChanged: (password) => context.read<AdminLoginBloc>().add(LoginPasswordChanged(password)),
            validationText: state.password.pure || state.password.error == null ? null :
            state.password.error == FieldRequiredValidationError.empty ? fieldRequiredFormat : null
        );
      },
    );
  }
}

class SignInAdminForgotPassword extends StatelessWidget {
  const SignInAdminForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextLink(
        description: '¿Olvidó su contraseña?',
        onPressed: () {},
      ),
    );
  }
}


class SignInSubmitButton extends StatelessWidget {
  const SignInSubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: BlocBuilder<AdminLoginBloc, AdminLoginState>(
        builder: (context, state) {
          return LargeSolidButton(
            text: 'INGRESAR',
            onPressed: state.status == FormzStatus.valid || state.status == FormzStatus.submissionFailure ?
                () => context.read<AdminLoginBloc>().add(const LoginSubmitted()) : null,
            child: state.status == FormzStatus.submissionInProgress ? const CircularProgressIndicator(color: Colors.white) : null,
          );
        },
      ),
    );
  }
}
