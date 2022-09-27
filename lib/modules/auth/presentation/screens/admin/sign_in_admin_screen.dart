import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:qola_app/core/base/injection_container.dart';
import 'package:qola_app/modules/auth/presentation/bloc/admin/admin_login_bloc.dart';
import 'package:qola_app/modules/auth/presentation/screens/admin/sign_in_admin_form.dart';
import 'package:qola_app/routes.dart';
import 'package:qola_app/shared/qola_pages.dart';

class SignInAdminScreen extends StatelessWidget {
  const SignInAdminScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAuthPage(
      padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
      child: BlocProvider(
        create: (context) => sl<AdminLoginBloc>(),
        child: const SignInAdminForm(),
      )
    );
  }
}

class SignInAdminForm extends StatelessWidget {
  const SignInAdminForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AdminLoginBloc, AdminLoginState>(
      listener: resolveResponse,
      child: Column(
        children: const [
          SignInAdminEmail(),
          SizedBox(height: 15.0),
          SignInAdminPassword(),
          SizedBox(height: 15.0),
          SignInAdminForgotPassword(),
          SignInSubmitButton()
        ],
      ),
    );
  }

  void resolveResponse(BuildContext context, AdminLoginState state) {
    if (state.status == FormzStatus.submissionSuccess) {
      Navigator.pushNamedAndRemoveUntil(context, RoutesPath.mainAdminPath, (_) => false);
    }
    if (state.status == FormzStatus.submissionFailure) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(state.error ?? ''),
      ));
    }
  }
}

